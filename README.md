# nixpkgs
My Nixpkgs Overlay

A Nix flake providing multiple development shells with essential tools.

## About Nix

Nix is a powerful package manager for Linux and macOS that makes package management reliable and reproducible. It provides atomic upgrades and rollbacks, side-by-side installation of multiple versions, and ensures that dependency specifications are complete.

Learn more:
- [Official Nix Website](https://nixos.org)
- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nixpkgs Repository](https://github.com/NixOS/nixpkgs)

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

### Quick Start (From GitHub)

Use directly from GitHub without cloning:

```bash
# Run a shell directly from GitHub
nix develop github:voidtek/nixpkgs#devops
nix develop github:voidtek/nixpkgs#python
nix develop github:voidtek/nixpkgs#docker
```

### Local Development

If you've cloned this repository:

```bash
# Available profiles
nix develop .#default    # Basic tools
nix develop .#python     # Python development
nix develop .#docker     # Docker tools
nix develop .#hugo       # Hugo static sites
nix develop .#devops     # DevOps/Infrastructure
```

### Automatic Shell Activation with direnv

Automatically load environments when entering directories:

#### For Your Own Projects (Using GitHub)

```bash
# Install direnv and nix-direnv
nix profile add nixpkgs#direnv
nix profile add nixpkgs#nix-direnv

# Configure nix-direnv
mkdir -p ~/.config/direnv
echo 'source $HOME/.nix-profile/share/nix-direnv/direnvrc' > ~/.config/direnv/direnvrc

# Add to your shell config (~/.bashrc or ~/.zshrc)
eval "$(direnv hook bash)"  # or: eval "$(direnv hook zsh)"

# In your project directory, create .envrc
echo "use flake github:voidtek/nixpkgs#devops" > .envrc
direnv allow
```

#### For Local Development (This Repository)

```bash
# Same setup as above, but use local path
echo "use flake .#devops" > .envrc
direnv allow
```

The first load takes a few minutes, subsequent loads are instant thanks to nix-direnv caching.

#### Clear Cache

```bash
# Clear nix-direnv cache
rm -rf ~/.cache/nix-direnv/*

# Reload environment
direnv reload
```

## Use Cases

### Use Case 1: Quick DevOps Shell

Run a DevOps environment without any installation:

```bash
nix develop github:voidtek/nixpkgs#devops
```

### Use Case 2: Project-Specific Environment

Add to any project for consistent tooling:

```bash
cd ~/my-project
echo "use flake github:voidtek/nixpkgs#devops" > .envrc
direnv allow
```

### Use Case 3: Custom Development

Clone and modify for your needs:

```bash
git clone https://github.com/voidtek/nixpkgs.git
cd nixpkgs
# Edit shells/*.nix files
nix develop .#devops
```

## Requirements
- Nix package manager installed with flakes enabled
- x86_64-linux or aarch64-linux system
- Docker daemon running (for docker profile)

### Quick Install
```bash
# One-line install (downloads and runs install script)
curl -fsSL https://raw.githubusercontent.com/voidtek/nixpkgs/main/scripts/install.sh | bash

# Or clone and run locally
git clone https://github.com/voidtek/nixpkgs.git
cd nixpkgs
./scripts/install.sh
```

The install script will:
- Install Git (if not present)
- Install Nix with flakes enabled
- Optionally install Docker
- Support Ubuntu/Debian, Fedora/RHEL, and Arch Linux

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
📦 uv: 0.9.7
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
📦 renovate: 39.126.0
```

## Contributing

Contributions are welcome! This is an open source project.

- Report issues: [GitHub Issues](https://github.com/voidtek/nixpkgs/issues)
- Submit pull requests: [GitHub Pull Requests](https://github.com/voidtek/nixpkgs/pulls)
- Contribute to Nixpkgs: [NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md)

## License
MIT