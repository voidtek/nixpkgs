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
- Docker daemon running (for docker profile)

### Installation Script
```bash
# Install Git (Ubuntu/Debian)
sudo apt update && sudo apt install -y git

# Install Nix with flakes
curl -L https://nixos.org/nix/install | sh -s -- --daemon
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon

# Install Docker (Ubuntu/Debian)
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
```

## License
MIT