#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

TARGET_BRANCH="${1:-$(git branch --show-current)}"

if [[ "$TARGET_BRANCH" != "develop" && "$TARGET_BRANCH" != "main" && "$TARGET_BRANCH" != "release" ]]; then
  echo "Only 'develop', 'release', or 'main' can be pushed with this script."
  echo "Usage: bash ./scripts/push_shared_branch.sh [develop|release|main]"
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

if ! git show-ref --verify --quiet "refs/heads/$TARGET_BRANCH"; then
  echo "Local branch '$TARGET_BRANCH' does not exist."
  exit 1
fi

CURRENT_BRANCH="$(git branch --show-current)"

if [[ "$CURRENT_BRANCH" != "$TARGET_BRANCH" ]]; then
  echo "Switching to '$TARGET_BRANCH' from '$CURRENT_BRANCH'..."
  git checkout "$TARGET_BRANCH"
fi

echo "Pushing '$TARGET_BRANCH' to origin..."
git push origin "$TARGET_BRANCH"

echo "Pushing '$TARGET_BRANCH' to personal..."
git push personal "$TARGET_BRANCH"

echo "Done: '$TARGET_BRANCH' pushed to origin and personal."
