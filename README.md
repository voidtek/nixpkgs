# nixpkgs
My Nixpkgs Overlay

A Nix flake providing multiple development shells with essential tools.

## Available Profiles

### Default Profile
Basic development tools and utilities

### Python Profile  
Python development environment with common packages

### Docker Profile
Docker containerization tools

### Hugo Profile
Static site generation with Hugo

### DevOps Profile
Infrastructure and DevOps toolchain

## Usage
```bash
# Available profiles
nix develop .#default    # Basic tools
nix develop .#python     # Python development
nix develop .#docker     # Docker tools
nix develop .#hugo       # Hugo static sites
nix develop .#devops     # DevOps/Infrastructure

# Or run directly from GitHub
nix develop github:voidtek/nixpkgs#devops
```

## Requirements
- Git installed
- Nix package manager installed with flakes enabled
- x86_64-linux or aarch64-linux system
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

## Version Checking

```bash
# Check all package versions across profiles
./scripts/check-versions.sh
```

See [scripts/README.md](scripts/README.md) for detailed usage instructions.

### Current Status
```
🔍 Package versions in nixpkgs...
================================
📦 Default Profile:
📦 wget: 1.25.0
📦 curl: 8.16.0
📦 shellcheck: 0.11.0
📦 htop: 3.4.1
📦 btop: 1.4.5
📦 ncdu: 2.9.2
📦 nano: 8.6
📦 cacert: 3.115
📦 gnupg: 2.4.8

🐍 Python Profile:
📦 python3: 3.13.9
📦 pip: 25.0.1
📦 pylint: 3.3.7

🐳 Docker Profile:
📦 docker: 28.5.1
📦 docker-compose: 2.39.4
📦 docker-buildx: 0.29.1

📝 Hugo Profile:
📦 hugo: 0.152.2
📦 nodejs: 22.21.1
📦 git: 2.51.2
📦 go: 1.25.3

⚙️  DevOps Profile:
📦 opentofu: 1.10.7
📦 kubectl: 1.34.1
📦 talosctl: 1.11.5
📦 k9s: 0.50.16
📦 jq: 1.8.1
📦 helm: 3.19.1
📦 tflint: 0.59.1
📦 terraform-docs: 0.20.0
📦 kube-score: 1.20.0
📦 kubeconform: 0.7.0
📦 helm-docs: 1.14.2
📦 yamllint: 1.37.1
📦 awscli2: 2.31.11
```

## License
MIT