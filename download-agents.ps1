$base = "https://raw.githubusercontent.com/ahmedhazim97/DevinOS/main/.agents"
$out  = "c:\Users\Ahmed Hazim\CascadeProjects\DevinOS\.agents"

$rules = @(
  "ai.md","api.md","architecture.md","communication.md","database.md",
  "debugging.md","deployment.md","documentation.md","engineering.md",
  "git.md","learning.md","mcp.md","memory.md","monitoring.md",
  "performance.md","planning.md","quality.md","review.md","security.md",
  "testing.md","ux.md"
)

$skills = @(
  "ai-engineering","api-design","architecture","backend","ci-cd",
  "code-review","database","debugging","docker","documentation",
  "frontend","git","incident-response","knowledge-distillation",
  "mcp","performance","planning","quality-audit","refactoring",
  "root-cause-analysis","security","testing","verification"
)

New-Item -ItemType Directory -Force -Path "$out\rules" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\skills" | Out-Null

foreach ($r in $rules) {
  Invoke-WebRequest -Uri "$base/rules/$r" -OutFile "$out\rules\$r"
  Write-Host "Downloaded rule: $r"
}

foreach ($s in $skills) {
  New-Item -ItemType Directory -Force -Path "$out\skills\$s" | Out-Null
  Invoke-WebRequest -Uri "$base/skills/$s/SKILL.md" -OutFile "$out\skills\$s\SKILL.md"
  Write-Host "Downloaded skill: $s"
}

Write-Host "`nDone! All .agents/ files restored locally."
