#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

TARGET_BRANCH="${1:-}"
COMMIT_MESSAGE="${2:-}"
CURRENT_BRANCH="$(git branch --show-current)"
PUBLISH_SCRIPT_PATH="scripts/publish_branch.sh"
PUSH_SCRIPT_PATH="scripts/push_shared_branch.sh"
TEMP_WORKTREE_DIR=""
TEMP_BRANCH_NAME=""

cleanup_temp_resources() {
  if [[ -n "$TEMP_WORKTREE_DIR" && -d "$TEMP_WORKTREE_DIR" ]]; then
    git worktree remove --force "$TEMP_WORKTREE_DIR" >/dev/null 2>&1 || true
  fi

  if [[ -n "$TEMP_BRANCH_NAME" ]]; then
    git branch -D "$TEMP_BRANCH_NAME" >/dev/null 2>&1 || true
  fi
}

push_origin_without_publish_script() {
  TEMP_WORKTREE_DIR="$(mktemp -d "${TMPDIR:-/tmp}/moding-origin-push.XXXXXX")"
  TEMP_BRANCH_NAME="codex/temp-origin-push-${TARGET_BRANCH}-$$"

  git worktree add --detach "$TEMP_WORKTREE_DIR" HEAD >/dev/null
  git -C "$TEMP_WORKTREE_DIR" checkout -b "$TEMP_BRANCH_NAME" >/dev/null

  if git rev-parse --verify --quiet "origin/$TARGET_BRANCH" >/dev/null; then
    for script_path in "$PUBLISH_SCRIPT_PATH" "$PUSH_SCRIPT_PATH"; do
      if git cat-file -e "origin/$TARGET_BRANCH:$script_path" 2>/dev/null; then
        git -C "$TEMP_WORKTREE_DIR" checkout "origin/$TARGET_BRANCH" -- "$script_path"
      else
        git -C "$TEMP_WORKTREE_DIR" rm -f --ignore-unmatch "$script_path" >/dev/null 2>&1 || true
        rm -f "$TEMP_WORKTREE_DIR/$script_path"
      fi
    done
  else
    for script_path in "$PUBLISH_SCRIPT_PATH" "$PUSH_SCRIPT_PATH"; do
      git -C "$TEMP_WORKTREE_DIR" rm -f --ignore-unmatch "$script_path" >/dev/null 2>&1 || true
      rm -f "$TEMP_WORKTREE_DIR/$script_path"
    done
  fi

  if ! git -C "$TEMP_WORKTREE_DIR" diff --quiet HEAD -- "$PUBLISH_SCRIPT_PATH" "$PUSH_SCRIPT_PATH"; then
    git -C "$TEMP_WORKTREE_DIR" add -A -- scripts
    git -C "$TEMP_WORKTREE_DIR" commit --amend --no-edit >/dev/null
  fi

  git push origin "$TEMP_BRANCH_NAME:$TARGET_BRANCH"
}

trap cleanup_temp_resources EXIT

if [[ "$TARGET_BRANCH" != "develop" && "$TARGET_BRANCH" != "main" ]]; then
  echo "Only 'develop' or 'main' can be published with this script."
  echo "Usage: ./scripts/publish_branch.sh [develop|main] \"commit message\""
  exit 1
fi

if [[ -z "$COMMIT_MESSAGE" ]]; then
  echo "Commit message is required."
  echo "Usage: ./scripts/publish_branch.sh [develop|main] \"commit message\""
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
  exit 1
fi

echo "Creating commit on '$TARGET_BRANCH'..."
git commit -m "$COMMIT_MESSAGE"

echo "Pushing '$TARGET_BRANCH' to origin..."
push_origin_without_publish_script

echo "Pushing '$TARGET_BRANCH' to personal..."
git push personal "$TARGET_BRANCH"

echo "Done: commit created and pushed to origin/personal on '$TARGET_BRANCH'."
