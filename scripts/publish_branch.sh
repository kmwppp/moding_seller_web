#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

TARGET_BRANCH="${1:-}"
COMMIT_MESSAGE="${2:-}"
CURRENT_BRANCH="$(git branch --show-current)"

if [[ "$TARGET_BRANCH" != "develop" && "$TARGET_BRANCH" != "main" && "$TARGET_BRANCH" != "release" ]]; then
  echo "Only 'develop', 'release', or 'main' can be published with this script."
  echo "Usage: bash ./scripts/publish_branch.sh [develop|release|main] \"commit message\""
  exit 1
fi

if [[ -z "$COMMIT_MESSAGE" ]]; then
  echo "Commit message is required."
  echo "Usage: bash ./scripts/publish_branch.sh [develop|release|main] \"commit message\""
  exit 1
fi

if [[ "$CURRENT_BRANCH" != "$TARGET_BRANCH" ]]; then
  echo "Current branch is '$CURRENT_BRANCH'."
  echo "Please switch to '$TARGET_BRANCH' first, then run the script again."
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "Missing git remote: origin"
  exit 1
fi

if ! git remote get-url personal >/dev/null 2>&1; then
  echo "Missing git remote: personal"
  exit 1
fi

echo "Staging changes..."
git add -A -- . \
  ':(exclude).codex_tmp_spreadsheet' \
  ':(exclude).codex_tmp_spreadsheet/**'

if git diff --cached --quiet; then
  echo "No staged changes to commit."
else
  echo "Creating commit on '$TARGET_BRANCH'..."
  git commit -m "$COMMIT_MESSAGE"
fi

echo "Pushing '$TARGET_BRANCH' to origin..."
git push origin "$TARGET_BRANCH"

echo "Pushing '$TARGET_BRANCH' to personal..."
git push personal "$TARGET_BRANCH"

echo "Done: '$TARGET_BRANCH' published to origin and personal."
