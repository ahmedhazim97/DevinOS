# DevinOS Auto-Installer for Windows
# Supports: Windsurf, Cursor, Claude Code
# Usage: irm https://raw.githubusercontent.com/ahmedhazim97/DevinOS/main/install.ps1 | iex

$ErrorActionPreference = "Stop"
$repoUrl = "https://raw.githubusercontent.com/ahmedhazim97/DevinOS/main/.agents"
$tempDir = Join-Path $env:TEMP "devinos-install-$(Get-Random)"

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

function InstallWindsurf {
    PrintHeader "Installing for Windsurf"
    $base = "$env:USERPROFILE\.codeium\windsurf"
    $memories = "$base\memories"
    $skillsDir = "$base\skills"

    New-Item -ItemType Directory -Force -Path $memories | Out-Null
    New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

    $rulesFile = "$memories\global_rules.md"
    $content = "# DevinOS Global Rules`n`n> Source: https://github.com/ahmedhazim97/DevinOS`n> Date: $(Get-Date -Format 'yyyy-MM-dd')`n> Total Rules: 21`n`n---`n`n"
    $rules = @("ai","api","architecture","communication","database","debugging","deployment","documentation","engineering","git","learning","mcp","memory","monitoring","performance","planning","quality","review","security","testing","ux")
    foreach ($r in $rules) {
        $url = "$repoUrl/rules/$r.md"
        $tmp = "$tempDir\rules\$r.md"
        if (DownloadFile $url $tmp) {
            $content += (Get-Content $tmp -Raw) + "`n`n---`n`n"
            PrintSuccess "Rule: $r"
        } else {
            PrintFail "Failed: $r"
        }
    }
    $content | Out-File -Encoding utf8 $rulesFile
    PrintSuccess "Global Rules written"

    $skills = @("ai-engineering","api-design","architecture","backend","ci-cd","code-review","database","debugging","docker","documentation","frontend","git","incident-response","knowledge-distillation","mcp","performance","planning","quality-audit","refactoring","root-cause-analysis","security","testing","verification")
    foreach ($s in $skills) {
        $dst = "$skillsDir\$s"
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        $url = "$repoUrl/skills/$s/SKILL.md"
        $tmp = "$tempDir\skills\$s\SKILL.md"
        New-Item -ItemType Directory -Force -Path "$tempDir\skills\$s" | Out-Null
        if (DownloadFile $url $tmp) {
            Copy-Item $tmp "$dst\SKILL.md" -Force
            $title = ((Get-Content $tmp -Raw) -split "`n")[0] -replace "# Skill: ", ""
            @{name=$s; displayName=$title; description="DevinOS skill: $title"; version="1.0.0"; author="ahmedhazim97"; platforms=@("windsurf")} | ConvertTo-Json | Out-File -Encoding utf8 "$dst\skill.json"
            PrintSuccess "Skill: $s"
        } else {
            PrintFail "Failed: $s"
        }
    }

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

    $rules = @("ai","api","architecture","communication","database","debugging","deployment","documentation","engineering","git","learning","mcp","memory","monitoring","performance","planning","quality","review","security","testing","ux")
    foreach ($r in $rules) {
        $url = "$repoUrl/rules/$r.md"
        $tmp = "$tempDir\rules\$r.md"
        if (DownloadFile $url $tmp) {
            Copy-Item $tmp "$rulesDir\$r.md" -Force
            PrintSuccess "Rule: $r"
        } else {
            PrintFail "Failed: $r"
        }
    }

    $cursorRules = "$env:USERPROFILE\.cursorrules"
    $content = "# DevinOS Rules`n`n> Source: https://github.com/ahmedhazim97/DevinOS`n`n"
    foreach ($r in $rules) {
        $tmp = "$tempDir\rules\$r.md"
        if (Test-Path $tmp) { $content += (Get-Content $tmp -Raw) + "`n`n---`n`n" }
    }
    $content | Out-File -Encoding utf8 $cursorRules
    PrintSuccess "Global .cursorrules written"

    $skills = @("ai-engineering","api-design","architecture","backend","ci-cd","code-review","database","debugging","docker","documentation","frontend","git","incident-response","knowledge-distillation","mcp","performance","planning","quality-audit","refactoring","root-cause-analysis","security","testing","verification")
    foreach ($s in $skills) {
        $dst = "$skillsDir\$s"
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        $url = "$repoUrl/skills/$s/SKILL.md"
        $tmp = "$tempDir\skills\$s\SKILL.md"
        New-Item -ItemType Directory -Force -Path "$tempDir\skills\$s" | Out-Null
        if (DownloadFile $url $tmp) {
            Copy-Item $tmp "$dst\SKILL.md" -Force
            PrintSuccess "Skill: $s"
        } else {
            PrintFail "Failed: $s"
        }
    }

    Write-Host "`nCursor installation complete! Restart Cursor to activate." -ForegroundColor Green
}

function InstallLocal {
    PrintHeader "Installing locally (.agents/)"
    $cwd = Get-Location
    $agentsDir = "$cwd\.agents"
    $rulesDir = "$agentsDir\rules"
    $skillsDir = "$agentsDir\skills"
    New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null
    New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

    $rules = @("ai","api","architecture","communication","database","debugging","deployment","documentation","engineering","git","learning","mcp","memory","monitoring","performance","planning","quality","review","security","testing","ux")
    foreach ($r in $rules) {
        $url = "$repoUrl/rules/$r.md"
        if (DownloadFile $url "$rulesDir\$r.md") {
            PrintSuccess "Rule: $r"
        } else {
            PrintFail "Failed: $r"
        }
    }

    $skills = @("ai-engineering","api-design","architecture","backend","ci-cd","code-review","database","debugging","docker","documentation","frontend","git","incident-response","knowledge-distillation","mcp","performance","planning","quality-audit","refactoring","root-cause-analysis","security","testing","verification")
    foreach ($s in $skills) {
        $dst = "$skillsDir\$s"
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        if (DownloadFile "$repoUrl/skills/$s/SKILL.md" "$dst\SKILL.md") {
            PrintSuccess "Skill: $s"
        } else {
            PrintFail "Failed: $s"
        }
    }

    Write-Host "`nLocal .agents/ folder created! Devin will auto-discover it." -ForegroundColor Green
}

# ========== MAIN ==========
PrintHeader "DevinOS Installer"
PrintStep "Repo: ahmedhazim97/DevinOS"
PrintStep "Temp: $tempDir"

New-Item -ItemType Directory -Force -Path "$tempDir\rules" | Out-Null
New-Item -ItemType Directory -Force -Path "$tempDir\skills" | Out-Null

$hasWindsurf = Test-Path "$env:USERPROFILE\.codeium\windsurf"
$hasCursor  = (Test-Path "$env:APPDATA\Cursor") -or (Test-Path "$env:USERPROFILE\.cursor")

if ($hasWindsurf) { InstallWindsurf }
if ($hasCursor)   { InstallCursor }

if (-not $hasWindsurf -and -not $hasCursor) {
    PrintStep "No supported IDE detected. Falling back to local install."
    InstallLocal
}

Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "`nDone!" -ForegroundColor Green
