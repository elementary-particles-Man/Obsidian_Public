# Requires: PowerShell 5+
Param(
    [switch]$WhatIf
)

$ErrorActionPreference = 'Stop'

Function Ensure-Dirs {
    param([string]$Root)
    $dirs = @(
        '00_ARCHIVE/JU_Concept',
        '00_ARCHIVE/PSM_Framework',
        '00_ARCHIVE/Project_Ark_Legacy',
        '01_INTELLIGENCE_VAULT/Geopolitical',
        '01_INTELLIGENCE_VAULT/Economic',
        '01_INTELLIGENCE_VAULT/Domestic',
        '01_INTELLIGENCE_VAULT/Resources',
        '02_WORKING_DRAFTS/Global_Risk_Models',
        '02_WORKING_DRAFTS/Ark-R_Design',
        '02_WORKING_DRAFTS/Domestic_Strategy',
        '03_FINAL_REPORTS/DR',
        '03_FINAL_REPORTS/Whitepapers',
        '04_PUBLIC_FACING/Walpurgis_9_30',
        '05_LOGS/Gemini_Logs',
        '05_LOGS/Meeting_Memos'
    )
    foreach ($d in $dirs) {
        $full = Join-Path $Root $d
        if (-not (Test-Path $full)) {
            New-Item -ItemType Directory -Path $full | Out-Null
        }
    }
}

Function Get-VersionTag {
    param([string]$Name, [string]$Content, [string]$Category)
    $tags = @()
    if ($Category -like '03_FINAL_REPORTS/DR*') { $tags += 'DR' }
    if ($Name -match '(?i)final|確定版|最終版') { $tags += 'final' }
    elseif ($Name -match '(?i)draft|草稿|ドラフト|下書き') { $tags += 'draft' }
    if ($Name -match '(?i)summary|要約|サマリ') { $tags += 'summary' }
    if ($Name -match '(?i)log|ログ|DevLog|開発ログ|議事録|Meeting|Memo') { $tags += 'log' }
    $ver = ($Name + ' ' + $Content) -match '(?i)(v|ver\.?)[ ]?([0-9]+(\.[0-9]+)*)'
    if ($ver) {
        $m = [regex]::Match(($Name + ' ' + $Content), '(?i)(v|ver\.?)[ ]?([0-9]+(\.[0-9]+)*)')
        if ($m.Success) { $tags += ('v' + $m.Groups[2].Value) }
    }
    if ($tags.Count -gt 0) { return ($tags -join '_') } else { return $null }
}

Function Normalize-Token {
    param([string]$s)
    if (-not $s) { return $null }
    $s = $s -replace '[^A-Za-z0-9_-]+','_'
    $s = $s.Trim('_')
    return $s
}

Function Get-Topic {
    param([string]$Path, [string]$Content)
    $name = [System.IO.Path]::GetFileNameWithoutExtension($Path)
    $n = $name
    $topic = $null

    # Prefer existing latin tokens in name
    if ($n -match '(?i)(Ark[-_ ]?R)') { $topic = 'ArkR' }
    elseif ($n -match '(?i)Project[ _-]?Ark') { $topic = 'ProjectArk' }
    elseif ($n -match '(?i)Gemini|GPT') { $topic = 'ArkR_DevLog' }
    elseif ($n -match '(?i)Sanseito|\bSanseito\b') { $topic = 'Sanseito' }
    elseif ($n -match '(?i)Stress[ _-]?Test') { $topic = 'GlobalStressTest' }
    elseif ($n -match '(?i)Whitepaper') { $topic = 'Whitepaper' }
    elseif ($n -match '(?i)Meeting|Memo|Minutes|議事録') { $topic = 'MeetingMinutes' }
    elseif ($n -match '(?i)JU') { $topic = 'JU' }

    # Japanese keyword mapping (fallbacks)
    if (-not $topic) {
        if ($n -match '参政党') { $topic = 'Sanseito' }
        elseif ($n -match '世界経済') { $topic = 'GlobalEconomy' }
        elseif ($n -match 'ストレステスト') { $topic = 'GlobalStressTest' }
        elseif ($n -match '米国債務') { $topic = 'US-Debt' }
        elseif ($n -match '議事録') { $topic = 'MeetingMinutes' }
        elseif ($n -match '白書') { $topic = 'Whitepaper' }
        elseif ($n -match '国内') { $topic = 'Domestic' }
        elseif ($n -match '地政|地政学|国際') { $topic = 'Geopolitics' }
        elseif ($n -match '金融|金利|FRB|通貨|債務') { $topic = 'Finance' }
        elseif ($n -match 'JU構想') { $topic = 'JU' }
    }

    # Content-based hints if still null
    if (-not $topic) {
        if ($Content -match '(?i)Ark[-_ ]?R') { $topic = 'ArkR' }
        elseif ($Content -match '(?i)Gemini|GPT') { $topic = 'ArkR_DevLog' }
        elseif ($Content -match '参政党') { $topic = 'Sanseito' }
        elseif ($Content -match 'ストレステスト|Stress[ -]?Test') { $topic = 'GlobalStressTest' }
        elseif ($Content -match 'FRB|FIAT|債務') { $topic = 'FiatSystem' }
    }

    if (-not $topic) { $topic = 'Note' }

    # Keep PartN if present
    $part = $null
    if ($n -match '(?i)Part[ _-]?(\d+)') { $part = 'Part' + $Matches[1] }
    elseif ($Content -match '(?i)Part[ _-]?(\d+)') { $part = 'Part' + $Matches[1] }
    if ($part) { $topic = ($topic + '_' + $part) }

    return (Normalize-Token $topic)
}

Function Get-Category {
    param([string]$Path, [string]$Content)
    $n = [System.IO.Path]::GetFileName($Path)
    $dir = '01_INTELLIGENCE_VAULT/Geopolitical' # default fallback

    # Logs
    if ($Path -match '05_LOGS') { return '05_LOGS/Gemini_Logs' }
    if ($n -match '(?i)Gemini|GPT|DevLog|ログ|Log') { return '05_LOGS/Gemini_Logs' }
    if ($n -match '(?i)議事録|Meeting|Memo') { return '05_LOGS/Meeting_Memos' }

    # Final reports
    if ($n -match '(?i)DR|決裁|意思決定|依頼') { return '03_FINAL_REPORTS/DR' }
    if ($n -match '(?i)Whitepaper|白書') { return '03_FINAL_REPORTS/Whitepapers' }

    # Working drafts
    if ($n -match '(?i)Ark[-_ ]?R|骨子|設計|仕様|Design') { return '02_WORKING_DRAFTS/Ark-R_Design' }
    if ($n -match '(?i)Stress[ _-]?Test|モデル|simulation|リスク|Risk') { return '02_WORKING_DRAFTS/Global_Risk_Models' }
    if ($n -match '(?i)国内|戦略|Strategy') { return '02_WORKING_DRAFTS/Domestic_Strategy' }

    # Intelligence
    if ($n -match '経済|金利|債務|金融|FRB|通貨') { return '01_INTELLIGENCE_VAULT/Economic' }
    if ($n -match '参政党|国内|政党|日本政治') { return '01_INTELLIGENCE_VAULT/Domestic' }
    if ($n -match 'IAEA|NATO|台湾|国際|地政|外交') { return '01_INTELLIGENCE_VAULT/Geopolitical' }
    if ($n -match '参考|参考資料|Resources|リンク|URL|文献') { return '01_INTELLIGENCE_VAULT/Resources' }

    # Archives
    if ($n -match '(?i)\bJU\b|JU構想') { return '00_ARCHIVE/JU_Concept' }
    if ($n -match '(?i)\bPSM\b') { return '00_ARCHIVE/PSM_Framework' }
    if ($n -match '(?i)Project[ _-]?Ark|Ark(?!-R)') { return '00_ARCHIVE/Project_Ark_Legacy' }

    # Content fallback hints
    if ($Content -match '経済|金利|債務|金融|FRB|通貨') { return '01_INTELLIGENCE_VAULT/Economic' }
    if ($Content -match '参政党|国内|政党|日本政治') { return '01_INTELLIGENCE_VAULT/Domestic' }
    if ($Content -match 'IAEA|NATO|台湾|国際|地政|外交') { return '01_INTELLIGENCE_VAULT/Geopolitical' }
    if ($Content -match '(?i)Gemini|GPT|DevLog|ログ') { return '05_LOGS/Gemini_Logs' }
    if ($Content -match '議事録|Meeting|メモ') { return '05_LOGS/Meeting_Memos' }

    return $dir
}

Function Ensure-UniqueName {
    param([string]$Dir, [string]$BaseName)
    $candidate = Join-Path $Dir $BaseName
    if (-not (Test-Path $candidate)) { return $candidate }
    $name = [System.IO.Path]::GetFileNameWithoutExtension($BaseName)
    $ext = [System.IO.Path]::GetExtension($BaseName)
    $i = 2
    while ($true) {
        $cand = Join-Path $Dir ("{0}_dup{1}{2}" -f $name, $i, $ext)
        if (-not (Test-Path $cand)) { return $cand }
        $i++
    }
}

Function Build-NewName {
    param([System.IO.FileInfo]$Item, [string]$Topic, [string]$Version)
    $date = $Item.LastWriteTime.ToString('yyyyMMdd')
    if ([string]::IsNullOrWhiteSpace($Version)) {
        return ("{0}_{1}.md" -f $date, $Topic)
    } else {
        return ("{0}_{1}_{2}.md" -f $date, $Topic, $Version)
    }
}

Function Process-File {
    param([string]$Root, [string]$Path)
    $abs = Resolve-Path -LiteralPath $Path
    $rel = [System.IO.Path]::GetRelativePath($Root, $abs)

    # Keep root README.md in place
    if ((Split-Path -Leaf $abs) -ieq 'README.md' -and ([System.IO.Path]::GetDirectoryName($abs) -eq $Root)) {
        return [pscustomobject]@{From=$rel; To=$rel; Action='skip_root_readme'; Reason='keep root README'}
    }

    $item = Get-Item -LiteralPath $abs
    $content = try { Get-Content -LiteralPath $abs -Raw -ErrorAction SilentlyContinue } catch { '' }
    $category = Get-Category -Path $abs -Content $content
    $topic = Get-Topic -Path $abs -Content $content
    $version = Get-VersionTag -Name $item.Name -Content $content -Category $category
    $newName = Build-NewName -Item $item -Topic $topic -Version $version
    $destDir = Join-Path $Root $category
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir | Out-Null }
    $destPath = Ensure-UniqueName -Dir $destDir -BaseName $newName

    if ($WhatIf) {
        return [pscustomobject]@{From=$rel; To=([System.IO.Path]::GetRelativePath($Root,$destPath)); Action='plan'; Reason=$category}
    }

    Move-Item -LiteralPath $abs -Destination $destPath -Force
    return [pscustomobject]@{From=$rel; To=([System.IO.Path]::GetRelativePath($Root,$destPath)); Action='moved'; Reason=$category}
}

$root = (Get-Location).Path
Ensure-Dirs -Root $root

$files = rg --files -g "**/*.md" | Where-Object { $_ -ne $null }
if (-not $files) { Write-Host 'No markdown files found.'; exit 0 }

$results = New-Object System.Collections.Generic.List[object]
foreach ($f in $files) {
    try {
        $res = Process-File -Root $root -Path $f
        $results.Add($res)
    } catch {
        $results.Add([pscustomobject]@{From=$f; To=$null; Action='error'; Reason=$_.Exception.Message})
    }
}

$reportPath = Join-Path $root ('reorg_report_{0}.csv' -f (Get-Date -Format 'yyyyMMdd_HHmmss'))
$results | Export-Csv -Path $reportPath -NoTypeInformation -Encoding UTF8
Write-Host ("Processed {0} files. Report: {1}" -f $results.Count, $reportPath)

