#!/usr/bin/env bash

set -e

echo "🔍 Package versions in nixpkgs..."
echo "================================"

# Get Nix versions
get_nix_version() {
    nix eval --impure --expr "let pkgs = import <nixpkgs> {}; in pkgs.$1.version or \"unknown\"" 2>/dev/null | tr -d '"'
}

# Display version
show_version() {
    local name=$1
    local nix_ver=$2
    echo "📦 $name: $nix_ver"
}

echo "📦 Default Profile:"
show_version "wget" "$(get_nix_version wget)"
show_version "curl" "$(get_nix_version curl)"
show_version "shellcheck" "$(get_nix_version shellcheck)"
show_version "htop" "$(get_nix_version htop)"
show_version "btop" "$(get_nix_version btop)"
show_version "ncdu" "$(get_nix_version ncdu)"
show_version "nano" "$(get_nix_version nano)"
show_version "cacert" "$(get_nix_version cacert)"
show_version "gnupg" "$(get_nix_version gnupg)"

echo ""
echo "🐍 Python Profile:"
show_version "python3" "$(get_nix_version python3)"
show_version "pip" "$(get_nix_version python3Packages.pip)"
show_version "pylint" "$(get_nix_version python3Packages.pylint)"

echo ""
echo "🐳 Docker Profile:"
show_version "docker" "$(get_nix_version docker)"
show_version "docker-compose" "$(get_nix_version docker-compose)"
show_version "docker-buildx" "$(get_nix_version docker-buildx)"

echo ""
echo "📝 Hugo Profile:"
show_version "hugo" "$(get_nix_version hugo)"
show_version "nodejs" "$(get_nix_version nodejs)"
show_version "git" "$(get_nix_version git)"
show_version "go" "$(get_nix_version go)"

echo ""
echo "⚙️  DevOps Profile:"
show_version "opentofu" "$(get_nix_version opentofu)"
show_version "kubectl" "$(get_nix_version kubectl)"
show_version "talosctl" "$(get_nix_version talosctl)"
show_version "k9s" "$(get_nix_version k9s)"
show_version "jq" "$(get_nix_version jq)"
show_version "helm" "$(get_nix_version kubernetes-helm)"
show_version "tflint" "$(get_nix_version tflint)"
show_version "terraform-docs" "$(get_nix_version terraform-docs)"
show_version "kube-score" "$(get_nix_version kube-score)"
show_version "kubeconform" "$(get_nix_version kubeconform)"
show_version "helm-docs" "$(get_nix_version helm-docs)"
show_version "yamllint" "$(get_nix_version yamllint)"
show_version "awscli2" "$(get_nix_version awscli2)"

echo ""
echo "✨ Done!"