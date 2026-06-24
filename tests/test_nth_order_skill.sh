#!/bin/sh
set -eu

skill_dir="${1:-nth-order}"
skill_file="$skill_dir/SKILL.md"
reference_file="$skill_dir/references/methods.md"
agent_file="$skill_dir/agents/openai.yaml"

[ -f "$skill_file" ]
[ -f "$reference_file" ]
[ -f "$agent_file" ]

grep -Fq 'name: nth-order' "$skill_file"
grep -Fq 'description: Use when' "$skill_file"
! grep -Fq '[TODO' "$skill_file"
grep -Fq 'Futures Wheel' "$skill_file"
grep -Fq 'First order' "$skill_file"
grep -Fq 'Second order' "$skill_file"
grep -Fq 'Third order' "$skill_file"
grep -Fq 'Fourth order' "$skill_file"
grep -Fq 'Executive Brief' "$skill_file"
grep -Fq 'Strategy Memo' "$skill_file"
grep -Fq 'facts from inferences' "$skill_file"
grep -Fq 'watchpoints' "$skill_file"
grep -Fq 'AI makes accounting, payroll, and audit preparation' "$skill_file"
grep -Fq 'Transaction-cost economics' "$reference_file"
grep -Fq 'display_name: "Nth Order"' "$agent_file"
