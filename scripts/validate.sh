#!/usr/bin/env bash
# Checks every skills/*/SKILL.md for valid frontmatter.
set -euo pipefail
fail=0
for f in skills/*/SKILL.md; do
  dir=$(basename "$(dirname "$f")")
  head -1 "$f" | grep -qx -- '---' || { echo "✗ $f: missing frontmatter"; fail=1; continue; }
  name=$(awk '/^---$/{c++;next} c==1 && /^name:/{sub(/^name:[ ]*/,"");print;exit}' "$f")
  desc=$(awk '/^---$/{c++;next} c==1 && /^description:/{sub(/^description:[ ]*/,"");print;exit}' "$f")
  [[ "$name" == "$dir" ]] || { echo "✗ $f: name '$name' != folder '$dir'"; fail=1; }
  [[ "$name" =~ ^[a-z0-9-]{1,64}$ ]] || { echo "✗ $f: invalid name"; fail=1; }
  [[ -n "$desc" && ${#desc} -le 1024 ]] || { echo "✗ $f: description empty or >1024 chars"; fail=1; }
  [[ $fail -eq 0 ]] && echo "✓ $dir"
done
exit $fail
