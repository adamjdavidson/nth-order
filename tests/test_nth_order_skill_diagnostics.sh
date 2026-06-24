#!/bin/sh
set -eu

missing_dir="/private/tmp/nth-order-skill-contract-missing-$$"

if output=$(sh tests/test_nth_order_skill.sh "$missing_dir" 2>&1); then
  printf '%s\n' 'FAIL: expected the skill contract to reject a missing directory' >&2
  exit 1
fi

printf '%s' "$output" | grep -Fq "Missing required file: $missing_dir/SKILL.md" || {
  printf '%s\n' 'FAIL: missing-directory error did not identify the failed check' >&2
  exit 1
}
