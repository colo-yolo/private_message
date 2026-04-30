$ErrorActionPreference = 'Stop'

$testDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $testDir
$skillPath = Join-Path $root 'SKILL.md'
$evalPath = Join-Path $root 'evals\evals.json'

if (!(Test-Path $skillPath)) {
  throw "Missing SKILL.md"
}

$text = Get-Content -Raw $skillPath
$requiredNeedles = @(
  'name: reddit-gunpla-researcher',
  'description: Use when',
  '## Non-Negotiable Guardrails',
  'public context only',
  'consent',
  'spam',
  'impersonation',
  'bulk scraping',
  '## Input Contract',
  '## Workflow',
  '## Conversation Stages',
  '## Output Format',
  '## Question Bank',
  '## Concept Testing',
  '## Buying Intent Signals',
  '## Research Notes Schema',
  '## Refusal And Rewrite Rules'
)

foreach ($needle in $requiredNeedles) {
  if ($text -notlike "*$needle*") {
    throw "Missing required content: $needle"
  }
}

$unsafePatterns = @(
  'delay disclosure',
  'hide identity',
  'pretend to be unaffiliated',
  'mass dm',
  'scrape each user'
)

foreach ($pattern in $unsafePatterns) {
  if ($text.ToLowerInvariant() -like "*$pattern*") {
    throw "Unsafe wording found: $pattern"
  }
}

if (!(Test-Path $evalPath)) {
  throw "Missing evals.json"
}

$evals = Get-Content -Raw $evalPath | ConvertFrom-Json
if ($evals.skill_name -ne 'reddit-gunpla-researcher') {
  throw "Unexpected skill_name in evals.json"
}

if ($evals.evals.Count -lt 4) {
  throw "Expected at least 4 eval prompts"
}

"Skill validation passed."
