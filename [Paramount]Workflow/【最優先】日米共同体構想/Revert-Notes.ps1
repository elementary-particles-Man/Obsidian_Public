param(
  [string]$Root='.'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$rootFull = (Resolve-Path -LiteralPath $Root).Path
$mapPath = Join-Path $rootFull 'reorg-revert-map.json'
if (-not (Test-Path -LiteralPath $mapPath)) {
  throw "reorg-revert-map.json が見つかりません: $mapPath"
}

$map = Get-Content -Raw -LiteralPath $mapPath | ConvertFrom-Json
foreach ($m in $map) {
  try {
    $new = Join-Path $rootFull $m.NewRel
    $old = Join-Path $rootFull $m.OldRel
    [System.IO.Directory]::CreateDirectory((Split-Path $old -Parent)) | Out-Null
    Move-Item -LiteralPath $new -Destination $old -Force
    Write-Host "Reverted: $($m.NewRel) -> $($m.OldRel)"
  } catch {
    Write-Warning "Failed revert: $($m.NewRel) -> $($m.OldRel) : $($_.Exception.Message)"
  }
}
