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
  'same base image',
  'TakaraModel',
  'site-specific product-page keyword check',
  'manual product-image comparison',
  'Google Lens',
  'user explicitly says they already used Google image search or Google Lens',
  'non-China public internet',
  'Search order matters',
  'Marketplace and storefront risk',
  'Etsy',
  'Legacy hobby blogs',
  'expo coverage',
  'weak hooks',
  'Similar scenes are common in this category',
  'manual review',
  'consent',
  'spam',
  'impersonation',
  'bulk scraping',
  '## Input Contract',
  '## Workflow',
  '## Conversation Stages',
  '## Community Pool',
  '## Output Format',
  '## Comment Maintenance Playbook',
  '## Question Bank',
  '## Concept Testing',
  '## Buying Intent Signals',
  '## Research Notes Schema',
  '## Refusal And Rewrite Rules',
  'Several Gunpla display images',
  'Community (EN):',
  'Share-Invite Pattern',
  '1-2 public exchanges'
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
  'scrape each user',
  'skip the image search'
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

$evalPrompts = $evals.evals | ForEach-Object { $_.prompt }
$evalExpectations = $evals.evals | ForEach-Object { $_.expected_output }

if (($evalPrompts -join "`n") -notlike '*same base image*') {
  throw "Expected an eval covering same-base-image interception"
}

if (($evalPrompts -join "`n") -notlike '*China-platform matches*') {
  throw "Expected an eval covering China-only matches not auto-blocking"
}

if (($evalPrompts -join "`n") -notlike '*TakaraModel site-specific product-page keyword check plus manual product-image comparison*') {
  throw "Expected an eval covering TakaraModel keyword plus manual-image interception"
}

if (($evalPrompts -join "`n") -notlike '*Etsy site-specific product-page keyword check plus manual product-image comparison*') {
  throw "Expected an eval covering Etsy keyword plus manual-image interception"
}

if (($evalPrompts -join "`n") -notlike '*already used Google image search and did not find the image*') {
  throw "Expected an eval covering user-provided Google no-match handling"
}

if (($evalPrompts -join "`n") -notlike '*Blogspot event-report post*') {
  throw "Expected an eval covering hobby-blog interception"
}

if (($evalPrompts -join "`n") -notlike '*30 minutes*') {
  throw "Expected an eval covering comment maintenance timing"
}

if (($evalExpectations -join "`n") -notlike '*bilingual package*') {
  throw "Expected an eval covering bilingual post output"
}

if (($evalExpectations -join "`n") -notlike '*1-2 public exchanges*') {
  throw "Expected an eval covering DM delay after public rapport"
}

if (($evalExpectations -join "`n") -notlike '*non-China public internet*') {
  throw "Expected eval expectations to mention the non-China search gate"
}

if (($evalExpectations -join "`n") -notlike '*highest-priority match*') {
  throw "Expected eval expectations to mention marketplace-first priority"
}

"Skill validation passed."
