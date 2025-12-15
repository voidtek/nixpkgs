# 🛠️ nixpkgs

**Reproducible development environments with Nix flakes**

Zero-config development shells for any tech stack. Consistent tooling across teams and projects.

## ⚡ Quick Start

```bash
# Jump into any environment instantly
nix develop github:voidtek/nixpkgs#devops
nix develop github:voidtek/nixpkgs#python
nix develop github:voidtek/nixpkgs#docker
```

## 🎯 Environments

| Environment | Purpose | Tools |
|-------------|---------|-------|
| **default** | Basic dev tools | `git` `curl` `htop` `shellcheck` `nano` |
| **python** | Python development | `python3` `pip` `uv` `pylint` `black` |
| **docker** | Containerization | `docker` `docker-compose` `buildx` |
| **hugo** | Static sites | `hugo` `nodejs` `go` `git` |
| **devops** | Infrastructure | `terraform` `kubectl` `helm` `aws-cli` `k9s` |

## 🚀 Usage

### Remote (Recommended)
```bash
# Use directly from GitHub
nix develop github:voidtek/nixpkgs#devops
```

### Local
```bash
# Clone and use locally
git clone https://github.com/voidtek/nixpkgs.git
cd nixpkgs
nix develop .#devops
```

## 🔧 Requirements

- **Nix** with flakes enabled
- **Linux** (x86_64 or aarch64)
- **Docker** daemon (for docker profile)

### Installation

**Basic packages:**
```bash
sudo apt update && sudo apt install -y curl git
```

**Install Nix:**
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**Install Docker:**
```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

### Optional: Shell Aliases

Add these aliases to your `~/.bashrc` for quick environment switching:

```bash
# Nix development environments
alias nix-default='nix develop github:voidtek/nixpkgs#default'
alias nix-python='nix develop github:voidtek/nixpkgs#python'
alias nix-docker='nix develop github:voidtek/nixpkgs#docker'
alias nix-hugo='nix develop github:voidtek/nixpkgs#hugo'
alias nix-devops='nix develop github:voidtek/nixpkgs#devops'
alias nix-ai='nix develop github:voidtek/nixpkgs#ai'
```

## 🤝 Contributing

- **Issues:** [GitHub Issues](https://github.com/voidtek/nixpkgs/issues)
- **PRs:** [Pull Requests](https://github.com/voidtek/nixpkgs/pulls)
- **License:** MIT

---

*Built with ❤️ using Nix flakes*
