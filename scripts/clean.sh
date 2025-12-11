#!/usr/bin/env bash
set -e

echo "🧹 Cleaning nixpkgs workspace..."

# Remove result symlinks
if [ -L "result" ]; then
    echo "  Removing result symlink..."
    rm result
fi

# Clean direnv cache
if [ -d ".direnv" ]; then
    echo "  Cleaning direnv cache..."
    rm -rf .direnv
fi

# Clean Nix store (optional)
read -p "🗑️  Clean Nix store garbage? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "  Running nix-collect-garbage..."
    nix-collect-garbage -d
fi

echo "✅ Workspace cleaned!"
