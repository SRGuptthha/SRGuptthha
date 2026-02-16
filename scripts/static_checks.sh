#!/usr/bin/env bash
set -euo pipefail

echo "Running simple static checks..."

# Fail fast with clear file context
shopt -s nullglob
FILES=(.boomi/*.json)
if [ ${#FILES[@]} -eq 0 ]; then
  echo "No .boomi/*.json files found. Skipping JSON validation."
  exit 0
fi

for f in "${FILES[@]}"; do
  echo "Validating JSON: $f"
  # jq empty will only validate syntax; no output if valid
  if ! jq empty "$f"; then
    echo "❌ Invalid JSON in: $f"
    exit 1
  fi
done

echo "✓ Static checks passed"
