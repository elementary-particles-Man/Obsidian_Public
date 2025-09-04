param(
  [string]$Root = '.',
  [switch]$Apply,
  [int]$MaxTitleLen = 30,
  [switch]$SkipDates
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Resolve-FullPath([string]$p) {
  (Resolve-Path -LiteralPath $p).Path
}

$rootFull = [System.IO.Path]::GetFullPath((Resolve-FullPath $Root))

$excludeDirNames = @('.git','.obsidian','_assets','_refs','node_modules','.venv','.idea','.vscode')
$excludeFiles = @('Organize-Notes.ps1','STRUCTURE.md','INDEX.md')

function Test-PathContainsExcluded([string]$fullPath) {
  foreach ($name in $excludeDirNames) {
    if ($fullPath -match "[\\/]$([regex]::Escape($name))[\\/]") { return $true }
  }
  return $false
}

function Get-Text([string]$path) {
  Get-Content -LiteralPath $path -Raw -Encoding UTF8
}

function Split-Frontmatter([string]$text) {
  $m = [regex]::Match($text, '^(?s)---\s*\r?\n(.*?)\r?\n---\s*\r?\n(.*)$')
  if ($m.Success) {
    return @{
      HasFM = $true; FM = $m.Groups[1].Value; Body = $m.Groups[2].Value
    }
  } else {
    return @{
      HasFM = $false; FM = ''; Body = $text
    }
  }
}

function Parse-YamlLike([string]$fm) {
  $h = @{}
  foreach ($line in ($fm -split "\r?\n")) {
    if ($line -match '^\s*#') { continue }
    if ($line -match '^\s*([A-Za-z0-9_\-]+)\s*:\s*(.*)$') {
      $k = $matches[1]
      $v = $matches[2].Trim()
      if ($v -match '^\[(.*)\]$') {
        $arr = $matches[1].Split(',') | ForEach-Object { $_.Trim().Trim('"''') } | Where-Object { $_ -ne '' }
        $h[$k] = $arr
      } else {
        $h[$k] = $v.Trim('"''')
      }
    }
  }
  return $h
}

function Get-Tags($parsed, [string]$text) {
  $tags = @()
  if ($parsed -and ($parsed.ContainsKey('tags'))) {
    if ($parsed['tags'] -is [System.Array]) { $tags += $parsed['tags'] } elseif ($parsed['tags']) { $tags += @("$($parsed['tags'])") }
  }
  if ($text) {
    $inline = [regex]::Matches($text, '(?<![\w-])#([\p{L}\p{N}_\-\/]+)') | ForEach-Object { $_.Groups[1].Value }
    $tags += $inline
  }
  $tags = $tags | ForEach-Object { if ($_ -ne $null) { $_.ToString().Trim() } } | Where-Object { $_ -ne '' }
  return ,(@($tags | Select-Object -Unique))
}

function Pick-Title($parsed, [string]$body, [string]$fallback) {
  if ($parsed.ContainsKey('title') -and ($parsed['title'])) { return $parsed['title'] }
  $m = [regex]::Match($body, '(?m)^\s*#\s+(.+)$')
  if ($m.Success) { return $m.Groups[1].Value.Trim() }
  foreach ($line in ($body -split "\r?\n")) {
    $t = $line.Trim()
    if ($t) { return $t }
  }
  return $fallback
}

function Try-ParseDate([string]$s) {
  if ([string]::IsNullOrWhiteSpace($s)) { return $null }
  $tmp = [datetime]::MinValue
  if ([datetime]::TryParse($s, [ref]$tmp)) { return $tmp }
  $s2 = $s.Replace('/', '-').Replace('.', '-')
  if ([datetime]::TryParse($s2, [ref]$tmp)) { return $tmp }
  return $null
}

function Extract-Date($parsed, [string]$text) {
  foreach ($k in @('date','created','updated')) {
    if ($parsed -and $parsed.ContainsKey($k) -and $parsed[$k]) {
      $tmp = $null
      if ([datetime]::TryParse($parsed[$k], [ref]$tmp)) { return $tmp }
      $dt2 = Try-ParseDate $parsed[$k]
      if ($dt2) { return $dt2 }
    }
  }
  $m = [regex]::Match($text, '(\d{4}[-/.]\d{2}[-/.]\d{2}|\b\d{8}\b)')
  if ($m.Success) {
    $dt3 = Try-ParseDate ($m.Value.Replace('/', '-').Replace('.', '-'))
    if ($dt3) { return $dt3 }
  }
  return $null
}

function Sanitize-Name([string]$name, [int]$maxLen) {
  $n = $name -replace '[\\/:*?"<>|]', ' '
  $n = $n.Trim()
  if ($n.Length -gt $maxLen) { $n = $n.Substring(0, $maxLen).Trim() }
  return $n
}

function Classify-Folder([object]$tags, [string]$body, [string]$h1) {
  $tagSet = ''
  if ($tags) {
    $tagSet = (@($tags) | ForEach-Object { if ($_ -ne $null) { $_.ToString().ToLowerInvariant() } }) -join ' '
  }
  if ($tagSet -match 'todo|task|タスク') { return '50_タスク' }
  if ($tagSet -match '提案|ドラフト|proposal') { return '40_提案ドラフト' }
  if ($tagSet -match '資料|クリップ|source|reference|引用') { return '20_資料' }
  if ($tagSet -match '背景|調査|research') { return '10_背景調査' }

  $checkboxes = ([regex]::Matches($body, '(?m)^\s*- \[ \] ')).Count
  $urls = ([regex]::Matches($body, 'https?://')).Count
  if ($checkboxes -ge 3) { return '50_タスク' }
  if ($urls -ge 3) { return '20_資料' }
  if ($h1 -match '案|ドラフト|proposal') { return '40_提案ドラフト' }
  if ($body -match '背景|調査|research') { return '10_背景調査' }
  return '30_分析メモ'
}

function Ensure-UniqueName([string]$dir, [string]$baseNoExt, [hashtable]$usedNames) {
  $name = "$baseNoExt.md"
  $n = 2
  $key = "$dir|$name"
  while ($usedNames.ContainsKey($key) -or (Test-Path -LiteralPath (Join-Path $dir $name))) {
    $name = "$baseNoExt ($n).md"
    $key = "$dir|$name"
    $n++
  }
  $usedNames[$key] = $true
  return $name
}

function Make-Map() {
  $files = Get-ChildItem -LiteralPath $rootFull -Recurse -File -Filter *.md |
    Where-Object { $excludeFiles -notcontains $_.Name } |
    Where-Object { -not (Test-PathContainsExcluded $_.FullName) }

  $map = @()
  $used = @{}
  foreach ($f in $files) {
    $relOld = [IO.Path]::GetRelativePath($rootFull, $f.FullName) -replace '\\','/'
    $text = Get-Text $f.FullName
    $split = Split-Frontmatter $text
    $parsed = if ($split.HasFM) { Parse-YamlLike $split.FM } else { @{} }
    $tags = Get-Tags $parsed $text
    $title = Pick-Title $parsed $split.Body ([IO.Path]::GetFileNameWithoutExtension($f.Name))
    $title = Sanitize-Name $title $MaxTitleLen
    $dt = $null
    if (-not $SkipDates) { $dt = Extract-Date $parsed $text }
    $h1m = [regex]::Match($split.Body, '(?m)^\s*#\s+(.+)$')
    $h1 = if ($h1m.Success) { $h1m.Groups[1].Value.Trim() } else { $title }
    $folder = Classify-Folder $tags $split.Body $h1
    $destDir = Join-Path $rootFull $folder
    $baseNoExt = if ($dt) { $dt.ToString('yyyyMMdd') + '_' + $title } else { $title }
    $newFileName = Ensure-UniqueName -dir $destDir -baseNoExt $baseNoExt -usedNames $used
    $newFull = Join-Path $destDir $newFileName
    $newRel = [IO.Path]::GetRelativePath($rootFull, $newFull) -replace '\\','/'
    $map += [pscustomobject]@{
      OldFull = $f.FullName
      OldRel = $relOld
      OldBase = [IO.Path]::GetFileNameWithoutExtension($f.Name)
      NewFull = $newFull
      NewRel = $newRel
      NewBase = [IO.Path]::GetFileNameWithoutExtension($newFileName)
      Folder  = $folder
      Title   = $title
      Date    = if ($dt) { $dt.ToString('yyyy-MM-dd') } else { '' }
      URLCount= ([regex]::Matches($split.Body,'https?://')).Count
      Checkboxes = ([regex]::Matches($split.Body,'(?m)^\s*- \[ \] ')).Count
      Tags    = ($tags -join ' ')
    }
  }
  return ,$map
}

function Save-Preview([array]$map) {
  $csvPath = Join-Path $rootFull 'reorg-preview.csv'
  $map | Select-Object OldRel,NewRel,Folder,Title,Date,Tags,URLCount,Checkboxes |
    Export-Csv -NoTypeInformation -Encoding UTF8 -LiteralPath $csvPath
  Write-Host "Preview written: $csvPath"
}

function Get-RelativePath([string]$fromDir, [string]$toPath) {
  $fromFull = [IO.Path]::GetFullPath($fromDir)
  $toFull   = [IO.Path]::GetFullPath($toPath)
  if (-not $fromFull.EndsWith([IO.Path]::DirectorySeparatorChar)) { $fromFull += [IO.Path]::DirectorySeparatorChar }
  $uFrom = New-Object System.Uri($fromFull)
  $uTo   = New-Object System.Uri($toFull)
  $rel = $uFrom.MakeRelativeUri($uTo).ToString()
  return $rel
}

function Update-MarkdownLinks([string]$text, $m, $absMap) {
  $srcOldDir = Split-Path $m.OldFull -Parent
  $srcNewDir = Split-Path $m.NewFull -Parent
  $pattern = '(?<!\!)\[(?<label>[^\]]*)\]\((?<url>[^)\s]+)(?<title>\s+"[^"]*")?\)'
  return ([regex]::Replace($text, $pattern, {
    param($match)
    $label = $match.Groups['label'].Value
    $url = $match.Groups['url'].Value
    $title = $match.Groups['title'].Value
    if ($url -match '^(https?:|mailto:|#|data:)') { return $match.Value }
    if ($url -match '\\.(png|jpg|jpeg|gif|svg|webp)(#.*)?$') { return $match.Value }
    try {
      $targetOldAbs = $url
      if (-not ([System.IO.Path]::IsPathRooted($url))) {
        $targetOldAbs = Join-Path $srcOldDir $url
      }
      $targetOldAbs = [IO.Path]::GetFullPath($targetOldAbs)
    } catch { return $match.Value }
    $fragment = ''
    if ($targetOldAbs -match '^(.*?)(#.+)$') { $targetOldAbs = $matches[1]; $fragment = $matches[2] }
    if ($absMap.ContainsKey($targetOldAbs)) {
      $targetNewAbs = $absMap[$targetOldAbs]
      $rel = Get-RelativePath $srcNewDir $targetNewAbs
      return "[$label]($rel$fragment$title)"
    }
    return $match.Value
  }))
}

function Apply-Changes([array]$map) {
  # 準備: フォルダ作成
  ($map | Select-Object -ExpandProperty NewFull |
    ForEach-Object { Split-Path $_ -Parent } |
    Sort-Object -Unique) | ForEach-Object {
      [System.IO.Directory]::CreateDirectory($_) | Out-Null
    }

  # WikiLink 置換のための名前マップ（旧ベース名→新ベース名）
  $nameMap = @{}
  foreach ($m in $map) { $nameMap[$m.OldBase] = $m.NewBase }

  # 絶対パスマップ（旧絶対→新絶対）: Markdown相対リンク更新に使用（正規化して一致させる）
  $absMap = @{}
  foreach ($m in $map) {
    $oldKey = [IO.Path]::GetFullPath($m.OldFull)
    $newVal = [IO.Path]::GetFullPath($m.NewFull)
    $absMap[$oldKey] = $newVal
  }

  foreach ($m in $map) {
    try {
      $text = Get-Text $m.OldFull
      $split = Split-Frontmatter $text
      $bodyForReplace = $split.Body
      # WikiLink [[Old]] / [[Old|...]] / [[Old#...]] を [[New...]] に置換
      foreach ($k in $nameMap.Keys) {
        $v = [regex]::Escape($k)
        $new = $nameMap[$k]
        $bodyForReplace = [regex]::Replace($bodyForReplace, "\[\[($v)(#[^\]|]+)?(\|[^\]]+)?\]\]", "[[${new}$2$3]]")
      }
      # Markdown相対リンクを新しい相対に更新
      $bodyForReplace = Update-MarkdownLinks -text $bodyForReplace -m $m -absMap $absMap

      # frontmatter に title を補完（存在しない場合のみ）
      $newTitle = $m.NewBase
      if ($split.HasFM) {
        if (-not ([regex]::IsMatch($split.FM, '(?m)^\s*title\s*:'))) {
          $newFM = "title: $newTitle`r`n" + $split.FM
          $newText = "---`r`n$newFM`r`n---`r`n$bodyForReplace"
        } else {
          $newText = "---`r`n$split.FM`r`n---`r`n$bodyForReplace"
        }
      } else {
        $newText = "---`r`ntitle: $newTitle`r`n---`r`n$bodyForReplace"
      }

      # 書き戻し（先に内容更新、次に移動）
      Set-Content -LiteralPath $m.OldFull -Value $newText -Encoding UTF8
      Move-Item -LiteralPath $m.OldFull -Destination $m.NewFull -Force
      Write-Host "Moved: $($m.OldRel) -> $($m.NewRel)"
    } catch {
      Write-Warning "Failed: $($m.OldRel) -> $($m.NewRel) : $($_.Exception.Message)"
    }
  }

  $appliedCsv = Join-Path $rootFull 'reorg-applied.csv'
  $map | Select-Object OldRel,NewRel,Folder,Title,Date | Export-Csv -NoTypeInformation -Encoding UTF8 -LiteralPath $appliedCsv
  Write-Host "Applied log: $appliedCsv"

  # 目次生成
  try {
    $indexPath = Join-Path $rootFull 'INDEX.md'
    $byFolder = $map | Group-Object Folder | Sort-Object Name
    $lines = @('# 目次','')
    foreach ($g in $byFolder) {
      $lines += "## $($g.Name)"
      foreach ($r in ($g.Group | Sort-Object Title, NewRel)) {
        $lines += "- [$($r.Title)]($($r.NewRel))"
      }
      $lines += ''
    }
    Set-Content -LiteralPath $indexPath -Value $lines -Encoding UTF8
    Write-Host "INDEX generated: $indexPath"
  } catch {
    Write-Warning "INDEX generation failed: $($_.Exception.Message)"
  }

  # リバート用JSON保存
  try {
    $revertPath = Join-Path $rootFull 'reorg-revert-map.json'
    $json = ($map | Select-Object OldRel, NewRel) | ConvertTo-Json -Depth 3
    Set-Content -LiteralPath $revertPath -Value $json -Encoding UTF8
    Write-Host "Revert map saved: $revertPath"
  } catch {
    Write-Warning "Revert map save failed: $($_.Exception.Message)"
  }
}

# 実行フロー
$map = Make-Map
Save-Preview $map

if ($Apply) {
  Write-Host 'Applying changes...'
  Apply-Changes $map
} else {
  Write-Host 'Dry-run only. Use -Apply to perform changes.'
}
