# nixpkgs
My Nixpkgs Overlay

A Nix flake providing multiple development shells with essential tools.

## Available Profiles

### Default Profile
- wget, curl, shellcheck, unzip, htop, btop, nano, cacert, gnupg

### Python Profile  
- All default tools + Python 3, pip, pylint, and development packages
- Includes: jinja2, requests, pyyaml, beautifulsoup4, boto3, PyGithub, etc.

### Docker Profile
- All default tools + Docker, Docker Compose, Docker Buildx

### Hugo Profile
- All default tools + Hugo, Node.js, Git, Go

### DevOps Profile
- All default tools + OpenTofu, kubectl, talosctl, k9s, jq, helm
- Additional tools: tflint, terraform-docs, kube-score, kubeconform, helm-docs, yamllint, awscli

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

## License
MIT