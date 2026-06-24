#!/bin/sh
set -eu

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

require_file() {
  [ -f "$1" ] || fail "Missing required file: $1"
}

require_contains() {
  grep -Fq "$2" "$1" || fail "Expected $1 to contain: $2"
}

require_absent() {
  if grep -Fq "$2" "$1"; then
    fail "Expected $1 not to contain: $2"
  fi
}

skill_dir="${1:-nth-order}"
skill_file="$skill_dir/SKILL.md"
reference_file="$skill_dir/references/methods.md"
agent_file="$skill_dir/agents/openai.yaml"

require_file "$skill_file"
require_file "$reference_file"
require_file "$agent_file"

require_contains "$skill_file" 'name: nth-order'
require_contains "$skill_file" 'description: Use when'
require_absent "$skill_file" '[TODO'
require_contains "$skill_file" 'Futures Wheel'
require_contains "$skill_file" 'First order'
require_contains "$skill_file" 'Second order'
require_contains "$skill_file" 'Third order'
require_contains "$skill_file" 'Fourth order'
require_contains "$skill_file" 'Executive Brief'
require_contains "$skill_file" 'Strategy Memo'
require_contains "$skill_file" 'facts from inferences'
require_contains "$skill_file" 'watchpoints'
require_contains "$reference_file" 'Transaction-cost economics'
require_contains "$reference_file" 'https://www.jstor.org/stable/2626876'
require_contains "$agent_file" 'display_name: "Nth Order"'
