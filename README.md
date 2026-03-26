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

| Environment | Purpose | Additional Tools |
|-------------|---------|-----------------|
| **default** | Basic dev tools | — |
| **python** | Python development | `python3` `pip` `uv` `pylint` `jinja2` `boto3` `pygithub` `beautifulsoup4` `gitpython` |
| **docker** | Containerization | `docker` `docker-compose` `docker-buildx` `hadolint` |
| **web** | Web & static sites | `hugo` `nodejs` `go` `libwebp` `imagemagick` |
| **devops** | Infrastructure | `opentofu` `kubectl` `talosctl` `k9s` `helm` `awscli2` `renovate` `updatecli` `glab` `jsonnet` `nmap` |
| **ai** | AI/ML development | `python3` `jupyter` `numpy` `pandas` `matplotlib` `scikit-learn` `openai` |
| **kotlin** | Kotlin development | `kotlin` `gradle` `openjdk21` `android-studio` `android-tools` |

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
alias nix-web='nix develop github:voidtek/nixpkgs#web'
alias nix-devops='nix develop github:voidtek/nixpkgs#devops'
alias nix-ai='nix develop github:voidtek/nixpkgs#ai'
alias nix-kotlin='nix develop github:voidtek/nixpkgs#kotlin'
```

## 🤝 Contributing

- **Issues:** [GitHub Issues](https://github.com/voidtek/nixpkgs/issues)
- **PRs:** [Pull Requests](https://github.com/voidtek/nixpkgs/pulls)
- **License:** MIT

---

*Built with ❤️ using Nix flakes*
