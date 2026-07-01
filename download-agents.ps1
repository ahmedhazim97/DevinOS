$repo = "Devin-IQ/DevinOS"
$archiveUrl = "https://github.com/$repo/archive/refs/heads/main.zip"
$out = "c:\Users\Ahmed Hazim\CascadeProjects\DevinOS\.agents"
$tempDir = Join-Path $env:TEMP "devinos-agents-$(Get-Random)"
$archive = Join-Path $tempDir "devinos.zip"

New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
Invoke-WebRequest -Uri $archiveUrl -OutFile $archive -UseBasicParsing
Expand-Archive -Path $archive -DestinationPath $tempDir -Force
$root = Get-ChildItem -Path $tempDir -Directory | Where-Object { $_.Name -like "DevinOS-*" } | Select-Object -First 1
if (-not $root) { throw "Failed to locate extracted DevinOS archive" }
$agents = Join-Path $root.FullName ".agents"
if (-not (Test-Path $agents)) { throw "Archive does not contain .agents" }
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
Copy-Item -Path $agents -Destination $out -Recurse -Force
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Done! All .agents/ files restored locally from $repo."

