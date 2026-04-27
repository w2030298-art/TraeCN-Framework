# TraeCN-Framework Global Init Install Script (Windows)
# Usage:
#   Network: irm https://raw.githubusercontent.com/w2030298-art/TraeCN-Framework/main/scripts/install.ps1 | iex
#   Local:   .\scripts\install.ps1 -Local
#   Custom:  .\scripts\install.ps1 -SourceUrl "https://..."

param(
    [string]$SourceUrl = "https://github.com/w2030298-art/TraeCN-Framework/archive/refs/heads/main.zip",
    [switch]$Local,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# Paths
$ConfigRoot = Join-Path $env:USERPROFILE ".trae-configs"
$GlobalSkillDir = Join-Path $env:USERPROFILE ".trae-cn\skills\traecn-init"
$TempDir = Join-Path $env:TEMP "traecn-install-$(Get-Random)"

# Helpers
function Info($msg) { Write-Host $msg -ForegroundColor Cyan }
function Ok($msg) { Write-Host $msg -ForegroundColor Green }
function Warn($msg) { Write-Host $msg -ForegroundColor Yellow }
function Err($msg) { Write-Host $msg -ForegroundColor Red }

Info "=== TraeCN-Framework Global Init Install ==="
Info ""

# 1. Check Trae CN
if (-not (Test-Path "$env:USERPROFILE\.trae-cn")) {
    Err "ERROR: Trae CN not found at $env:USERPROFILE\.trae-cn"
    Info "Please install Trae CN first: https://www.trae.ai"
    exit 1
}

# 1.5. Check existing installation
$ExistingSkill = "$env:USERPROFILE\.trae-cn\skills\traecn-init\SKILL.md"
$CurrentVersion = $null
if (Test-Path $ExistingSkill) {
    $Lines = Get-Content $ExistingSkill -TotalCount 10
    foreach ($line in $Lines) {
        if ($line -match '^version:\s*(.+)$') {
            $CurrentVersion = $Matches[1].Trim()
            break
        }
    }
    if ($CurrentVersion) {
        Info "Detected existing installation: traecn-init $CurrentVersion"
    }
}

# 2. Determine source
$RepoRoot = $null
if ($Local) {
    $RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
    if (-not (Test-Path (Join-Path $RepoRoot ".trae"))) {
        Err "ERROR: Local mode requires running from repo root"
        Info "Detected: $RepoRoot"
        exit 1
    }
    Info "Local mode: using $RepoRoot"
} else {
    Info "Network mode: downloading from $SourceUrl ..."
    try {
        New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
        $ZipPath = Join-Path $TempDir "source.zip"
        Info "Downloading..."
        Invoke-WebRequest -Uri $SourceUrl -OutFile $ZipPath -UseBasicParsing
        Info "Extracting..."
        Expand-Archive -Path $ZipPath -DestinationPath $TempDir -Force
        $ExtractedDir = Get-ChildItem $TempDir -Directory | Where-Object { $_.Name -like "*TraeCN-Framework*" } | Select-Object -First 1
        if (-not $ExtractedDir) { throw "Cannot find extracted repo directory" }
        $RepoRoot = $ExtractedDir.FullName
    } catch {
        Err "Download/Extract failed: $_"
        Info "Suggestions:"
        Info "1. Check network connection"
        Info "2. Download manually and use -Local flag"
        exit 1
    }
}

# 2.5. Version check
$NewSkillFile = Join-Path $RepoRoot "scripts\traecn-init\SKILL.md"
$NewVersion = $null
if (Test-Path $NewSkillFile) {
    $NewLines = Get-Content $NewSkillFile -TotalCount 10
    foreach ($line in $NewLines) {
        if ($line -match '^version:\s*(.+)$') {
            $NewVersion = $Matches[1].Trim()
            break
        }
    }
}

if (-not $Force -and $CurrentVersion -and $NewVersion -and $CurrentVersion -eq $NewVersion) {
    Info ""
    Ok "Already up to date: traecn-init $CurrentVersion"
    Info "No update needed. Run with -Force to reinstall anyway."
    exit 0
} elseif ($CurrentVersion -and $NewVersion) {
    Info ""
    Info "Update available: $CurrentVersion -> $NewVersion"
} elseif ($NewVersion) {
    Info ""
    Info "New installation: traecn-init $NewVersion"
}

# 3. Create directories
Info ""
Info "Creating directories..."
New-Item -ItemType Directory -Path "$ConfigRoot\default" -Force | Out-Null
New-Item -ItemType Directory -Path $GlobalSkillDir -Force | Out-Null

# 4. Copy .trae/ to local config store
Info "Copying .trae/ to local config store..."
$TraeSource = Join-Path $RepoRoot ".trae"
if (-not (Test-Path $TraeSource)) {
    Err "ERROR: .trae/ not found in source directory"
    exit 1
}
Copy-Item -Path "$TraeSource\*" -Destination "$ConfigRoot\default\" -Recurse -Force

# 5. Install global skill
Info "Installing global init skill..."
$SkillSource = Join-Path $RepoRoot "scripts\traecn-init\SKILL.md"
if (Test-Path $SkillSource) {
    Copy-Item -Path $SkillSource -Destination "$GlobalSkillDir\SKILL.md" -Force
    Ok "  [OK] Global skill installed"
} else {
    Warn "  [WARN] Skill file not found: $SkillSource"
}

# 6. Create index
Info "Creating config index..."
$Today = Get-Date -Format "yyyy-MM-dd"
$IndexLines = @(
    "# TraeCN Local Config Index"
    ""
    "| Index | Path | Description | Updated |"
    "| :--- | :--- | :--- | :--- |"
    "| default | $ConfigRoot\default\ | Official default config | $Today |"
)
$IndexLines | Set-Content -Path "$ConfigRoot\index.md" -Encoding UTF8

# 7. Cleanup
if (-not $Local -and $TempDir -and (Test-Path $TempDir)) {
    Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue
}

# 8. Verify
Info ""
Info "=== Verification ==="
$Checks = @(
    @{ Path = "$ConfigRoot\default\config.md"; Name = "default config.md" },
    @{ Path = "$ConfigRoot\default\rules\00-核心身份.md"; Name = "rule 00-核心身份.md" },
    @{ Path = "$GlobalSkillDir\SKILL.md"; Name = "global init skill" },
    @{ Path = "$ConfigRoot\index.md"; Name = "config index.md" }
)
$AllOk = $true
foreach ($check in $Checks) {
    if (Test-Path $check.Path) {
        Ok "  [OK] $($check.Name)"
    } else {
        Err "  [FAIL] $($check.Name)"
        $AllOk = $false
    }
}

Info ""
if ($AllOk) {
    Ok "==========================================="
    Ok "  Installation Complete!"
    Ok "==========================================="
    Info ""
    Info "You can now use these commands in any workspace:"
    Info ""
    Info "  /init              - Auto-deploy and initialize"
    Info "  /init @default     - From local default config"
    Info "  /init <url>        - From custom URL"
    Info ""
    Info "Local config store: $ConfigRoot"
    Info "Global skill path: $GlobalSkillDir"
    Info ""
    Info "Tip: Edit $ConfigRoot\index.md to add more configs"
} else {
    Err "Verification failed. Please check errors above."
    exit 1
}
