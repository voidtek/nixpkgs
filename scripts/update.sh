#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLAKE_DIR="$(dirname "$SCRIPT_DIR")"

# Vérification des dépendances
for cmd in nix jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "❌ '$cmd' is required but not found in PATH"
    exit 1
  fi
done

cd "$FLAKE_DIR"

echo "🔄 Updating Nix flakes..."
echo ""

# Sauvegarder le lock actuel pour comparaison
OLD_LOCK=$(nix flake metadata --json 2>/dev/null | jq -r '.locks.nodes | to_entries[] | select(.key != "root") | "\(.key): \(.value.locked.rev[0:7])"' || true)

# Update
nix flake update

# Afficher le nouveau état
NEW_LOCK=$(nix flake metadata --json | jq -r '.locks.nodes | to_entries[] | select(.key != "root") | "\(.key): \(.value.locked.rev[0:7])"')

echo ""
echo "✅ Flake inputs updated!"
echo ""

if [ "$OLD_LOCK" = "$NEW_LOCK" ]; then
  echo "📋 No changes — already up to date."
else
  echo "📋 Updated inputs:"
  echo "$NEW_LOCK" | sed 's/^/  /'
fi

echo ""
echo "🧪 Test with: nix develop .#<profile>"
echo "   Profiles: default python docker web devops ai kotlin security"
