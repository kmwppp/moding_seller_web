#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

echo "Building production web bundle..."
echo "APP_ENV=prod"

flutter pub get
flutter analyze
flutter build web \
  --release \
  --pwa-strategy=none \
  --dart-define=FLUTTER_WEB_CANVASKIT_URL=false \
  --dart-define=APP_ENV=prod

echo "Done: production web bundle generated at build/web"
