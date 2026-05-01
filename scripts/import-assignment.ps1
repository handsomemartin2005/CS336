param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(
        "assignment1-basics",
        "assignment2-systems",
        "assignment3-scaling",
        "assignment4-data",
        "assignment5-alignment"
    )]
    [string]$Name
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$repo = "https://github.com/stanford-cs336/$Name.git"
$target = Join-Path $PSScriptRoot "..\assignments\$Name"
$temp = Join-Path ([System.IO.Path]::GetTempPath()) ("cs336-" + $Name + "-" + [System.Guid]::NewGuid())

function Get-LocalGitConfig {
    param([string]$Key)

    $value = git -C $repoRoot config --local --get $Key 2>$null
    if ($LASTEXITCODE -eq 0 -and $value) {
        return $value.Trim()
    }

    return $null
}

$gitConfigArgs = @()
foreach ($key in @("http.proxy", "https.proxy", "http.sslBackend")) {
    $value = Get-LocalGitConfig $key
    if ($value) {
        $gitConfigArgs += @("-c", "$key=$value")
    }
}

if (-not (Test-Path $target)) {
    New-Item -ItemType Directory -Path $target | Out-Null
}

$existing = Get-ChildItem -LiteralPath $target -Force | Where-Object { $_.Name -ne "README.md" }
if ($existing) {
    throw "Target folder is not empty: $target"
}

git @gitConfigArgs clone --depth 1 $repo $temp
Remove-Item -LiteralPath (Join-Path $temp ".git") -Recurse -Force

$studyReadme = Join-Path $target "README.md"
$officialReadme = Join-Path $temp "README.md"
if ((Test-Path $studyReadme) -and (Test-Path $officialReadme)) {
    Move-Item -LiteralPath $studyReadme -Destination (Join-Path $target "README.study.md")
}

Get-ChildItem -LiteralPath $temp -Force | ForEach-Object {
    Move-Item -LiteralPath $_.FullName -Destination $target
}

Remove-Item -LiteralPath $temp -Recurse -Force

Write-Host "Imported $repo into $target"
