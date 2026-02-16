#!/usr/bin/env bash
set -euo pipefail

echo "Running simple static checks..."
# Example: ensure JSON files are valid
for f in .boomi/*.json; do
  jq empty "$f"
done

echo "✓ Static checks passed"