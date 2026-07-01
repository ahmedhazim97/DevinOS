# DevinOS Auto-Installer for Windows
# Supports: Windsurf, Cursor, Claude Code
# Usage: irm https://raw.githubusercontent.com/Devin-IQ/DevinOS/main/install.ps1 | iex

$ErrorActionPreference = "Stop"
$repo = "Devin-IQ/DevinOS"
$repoUrl = "https://github.com/$repo"
$archiveUrl = "https://github.com/$repo/archive/refs/heads/main.zip"
$tempDir = Join-Path $env:TEMP "devinos-install-$(Get-Random)"
$agentsSource = $null

function PrintHeader($text) {
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  $text" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
}
function PrintSuccess($text) { Write-Host "  + $text" -ForegroundColor Green }
function PrintStep($text)  { Write-Host "  > $text" -ForegroundColor Yellow }
function PrintFail($text) { Write-Host "  x $text" -ForegroundColor Red }

function DownloadFile($url, $outPath) {
    try {
        Invoke-WebRequest -Uri $url -OutFile $outPath -UseBasicParsing
        return $true
    } catch {
        return $false
    }
}

function GetRules {
    return @("ai","api","architecture","communication","database","debugging","deployment","documentation","engineering","git","learning","mcp","memory","monitoring","performance","planning","quality","review","security","testing","ux")
}

function GetSkills {
    return @("ai-engineering","api-design","architecture","backend","ci-cd","code-review","database","debugging","docker","documentation","frontend","git","incident-response","knowledge-distillation","mcp","performance","planning","quality-audit","refactoring","root-cause-analysis","security","testing","verification","ui-ux-pro-max","design-resources-library")
}

function PrepareAgents {
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
    $archive = Join-Path $tempDir "devinos.zip"
    PrintStep "Downloading $repo"
    if (-not (DownloadFile $archiveUrl $archive)) { throw "Failed to download $archiveUrl" }
    Expand-Archive -Path $archive -DestinationPath $tempDir -Force
    $root = Get-ChildItem -Path $tempDir -Directory | Where-Object { $_.Name -like "DevinOS-*" } | Select-Object -First 1
    if (-not $root) { throw "Failed to locate extracted DevinOS archive" }
    $script:agentsSource = Join-Path $root.FullName ".agents"
    if (-not (Test-Path $script:agentsSource)) { throw "Archive does not contain .agents" }
}

function CopySkill($skill, $skillsDir) {
    $src = Join-Path $script:agentsSource "skills\$skill"
    $dst = Join-Path $skillsDir $skill
    if (-not (Test-Path $src)) { PrintFail "Missing skill: $skill"; return }
    if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
    Copy-Item -Path $src -Destination $dst -Recurse -Force
    $skillFile = Join-Path $dst "SKILL.md"
    $jsonFile = Join-Path $dst "skill.json"
    if ((Test-Path $skillFile) -and (-not (Test-Path $jsonFile))) {
        $raw = Get-Content $skillFile -Raw
        $name = $skill
        $description = "DevinOS skill: $skill"
        if ($raw -match "(?m)^description:\s*`"?([^`"`r`n]+)`"?") { $description = $Matches[1] }
        @{name=$name; displayName=$name; description=$description; version="1.0.0"; author="Devin-IQ"; platforms=@("windsurf")} | ConvertTo-Json | Out-File -Encoding utf8 $jsonFile
    }
    PrintSuccess "Skill: $skill"
}

function InstallWindsurf {
    PrintHeader "Installing for Windsurf"
    $base = "$env:USERPROFILE\.codeium\windsurf"
    $memories = "$base\memories"
    $rulesDir = "$base\rules"
    $skillsDir = "$base\skills"
    New-Item -ItemType Directory -Force -Path $memories | Out-Null
    New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null
    New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

    $rulesFile = "$memories\global_rules.md"
    $content = "# DevinOS Global Rules`n`n> Source: $repoUrl`n> Date: $(Get-Date -Format 'yyyy-MM-dd')`n> Total Rules: 21`n`n---`n`n"
    foreach ($r in GetRules) {
        $src = Join-Path $script:agentsSource "rules\$r.md"
        if (Test-Path $src) {
            Copy-Item $src "$rulesDir\$r.md" -Force
            $content += (Get-Content $src -Raw) + "`n`n---`n`n"
            PrintSuccess "Rule: $r"
        } else {
            PrintFail "Missing rule: $r"
        }
    }
    $content | Out-File -Encoding utf8 $rulesFile
    PrintSuccess "Global Rules written"

    foreach ($s in GetSkills) { CopySkill $s $skillsDir }
    Write-Host "`nWindsurf installation complete! Restart Windsurf to activate." -ForegroundColor Green
}

function InstallCursor {
    PrintHeader "Installing for Cursor"
    $cursorDir = "$env:APPDATA\Cursor\User"
    $rulesDir = "$cursorDir\rules"
    $skillsDir = "$cursorDir\skills"
    if (-not (Test-Path $cursorDir)) {
        $cursorDir = "$env:USERPROFILE\.cursor"
        $rulesDir = "$cursorDir\rules"
        $skillsDir = "$cursorDir\skills"
    }
    New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null
    New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

    $cursorRules = "$env:USERPROFILE\.cursorrules"
    $content = "# DevinOS Rules`n`n> Source: $repoUrl`n`n"
    foreach ($r in GetRules) {
        $src = Join-Path $script:agentsSource "rules\$r.md"
        if (Test-Path $src) {
            Copy-Item $src "$rulesDir\$r.md" -Force
            $content += (Get-Content $src -Raw) + "`n`n---`n`n"
            PrintSuccess "Rule: $r"
        } else {
            PrintFail "Missing rule: $r"
        }
    }
    $content | Out-File -Encoding utf8 $cursorRules
    PrintSuccess "Global .cursorrules written"

    foreach ($s in GetSkills) { CopySkill $s $skillsDir }
    Write-Host "`nCursor installation complete! Restart Cursor to activate." -ForegroundColor Green
}

function InstallClaude {
    PrintHeader "Installing for Claude Code"
    $base = "$env:USERPROFILE\.claude"
    $skillsDir = "$base\skills"
    New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null
    foreach ($s in GetSkills) { CopySkill $s $skillsDir }
    Write-Host "`nClaude Code installation complete!" -ForegroundColor Green
}

function InstallLocal {
    PrintHeader "Installing locally (.agents/)"
    $cwd = Get-Location
    $agentsDir = "$cwd\.agents"
    New-Item -ItemType Directory -Force -Path $agentsDir | Out-Null
    Copy-Item -Path "$script:agentsSource\rules" -Destination $agentsDir -Recurse -Force
    Copy-Item -Path "$script:agentsSource\skills" -Destination $agentsDir -Recurse -Force
    Write-Host "`nLocal .agents/ folder created! Devin will auto-discover it." -ForegroundColor Green
}

PrintHeader "DevinOS Installer"
PrintStep "Repo: $repo"
PrintStep "Temp: $tempDir"
PrepareAgents

$hasWindsurf = Test-Path "$env:USERPROFILE\.codeium\windsurf"
$hasCursor  = (Test-Path "$env:APPDATA\Cursor") -or (Test-Path "$env:USERPROFILE\.cursor")
$hasClaude = Test-Path "$env:USERPROFILE\.claude"

if ($hasWindsurf) { InstallWindsurf }
if ($hasCursor)   { InstallCursor }
if ($hasClaude)   { InstallClaude }

if (-not $hasWindsurf -and -not $hasCursor -and -not $hasClaude) {
    PrintStep "No supported IDE detected. Falling back to local install."
    InstallLocal
}

Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "`nDone!" -ForegroundColor Green

