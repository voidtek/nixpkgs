#!/usr/bin/env bash
set -e

echo "🔄 Updating Nix flakes..."

# Update flake inputs
nix flake update

echo "✅ Flake inputs updated!"
echo ""
echo "📋 Updated inputs:"
nix flake metadata --json | jq -r '.locks.nodes | to_entries[] | select(.key != "root") | "  \(.key): \(.value.locked.rev[0:7] // .value.locked.narHash[0:7])"'

echo ""
echo "🧪 Test environments after update:"
echo "  nix develop .#devops"
echo "  nix develop .#python"
echo "  nix develop .#docker"
