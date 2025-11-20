# nixpkgs
My Nixpkgs Overlay

A Nix flake providing a DevOps development shell with essential tools.

## Tools Included
- OpenTofu - Infrastructure as Code
- kubectl - Kubernetes CLI
- talosctl - Talos Linux management
- k9s - Kubernetes cluster management
- jq - JSON processor
- helm - Kubernetes package manager
- tflint - Terraform linter
- terraform-docs - Generate docs from Terraform modules
- kube-score - Kubernetes object analysis
- kubeconform - Kubernetes resource validation
- helm-docs - Generate documentation from Helm charts

## Usage
```bash
# Enter development shell
nix develop .#devops

# Or run directly
nix develop github:voidtek/nixpkgs#devops
```

## Requirements
- Git installed
- Nix package manager installed with flakes enabled
- x86_64-linux system

## License
MIT