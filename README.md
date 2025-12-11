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

### Auto-activation with direnv
```bash
# Setup (one-time)
nix profile add nixpkgs#{direnv,nix-direnv}
mkdir -p ~/.config/direnv
echo 'source $HOME/.nix-profile/share/nix-direnv/direnvrc' > ~/.config/direnv/direnvrc
eval "$(direnv hook bash)"  # Add to ~/.bashrc

# Per project
echo "use flake github:voidtek/nixpkgs#devops" > .envrc
direnv allow
```

## 💡 Examples

**DevOps workflow:**
```bash
nix develop github:voidtek/nixpkgs#devops
terraform init
kubectl get pods
```

**Python project:**
```bash
nix develop github:voidtek/nixpkgs#python
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

**Hugo site:**
```bash
nix develop github:voidtek/nixpkgs#hugo
hugo new site mysite
cd mysite
hugo server
```

## 🔧 Requirements

- **Nix** with flakes enabled
- **Linux** (x86_64 or aarch64)
- **Docker** daemon (for docker profile)

### Install Nix
```bash
# Quick install
curl -fsSL https://raw.githubusercontent.com/voidtek/nixpkgs/main/scripts/install.sh | bash
```

## 🤝 Contributing

- **Issues:** [GitHub Issues](https://github.com/voidtek/nixpkgs/issues)
- **PRs:** [Pull Requests](https://github.com/voidtek/nixpkgs/pulls)
- **License:** MIT

---

*Built with ❤️ using Nix flakes*
