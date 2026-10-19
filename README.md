# nixpkgs

**Reproducible development environments with Nix flakes**

Zero-config development shells for any tech stack. Consistent tooling across teams and projects.

## Quick Start

```bash
# Jump into any environment instantly
nix develop github:voidtek/nixpkgs#devops
nix develop github:voidtek/nixpkgs#python
nix develop github:voidtek/nixpkgs#hugo
```

## Environments

All environments also include a set of **common tools** (see below).

| Environment | Purpose | Additional Tools |
|-------------|---------|-----------------|
| **default** | Basic dev tools | — |
| **python** | Python development | `python-launcher` `pylint` |
| **docker** | Containerization | `docker` `docker-compose` `docker-buildx` `hadolint` `crane` |
| **hugo** | Hugo & static sites | `hugo` `go` `libwebp` `imagemagick` |
| **devops** | Infrastructure | `opentofu` `kubectl` `talosctl` `k9s` `jq` `kubernetes-helm` `tflint` `terraform-docs` `kube-score` `kubeconform` `helm-docs` `yamllint` `awscli2` `renovate` `updatecli` `glab` `jsonnet` `jsonnet-bundler` `dnsutils` |
| **security** | Security auditing | `osv-scanner` `pip-audit` `gitleaks` `nmap` |

### Common Tools (all environments)

`fish` `wget` `curl` `shellcheck` `unzip` `htop` `btop` `nano` `cacert` `gnupg` `ncdu` `git` `fastfetch` `nodejs` `yq` `bitwarden-cli` `python3` `uv`

## Usage

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

### Updating Packages

Package versions come from the pinned `nixpkgs` input in `flake.lock`.
After cloning, update them with:

```bash
# Update all inputs (nixpkgs + flake-utils) to their latest revisions
nix flake update

# Or update only nixpkgs
nix flake update nixpkgs
```

Then validate the change (same checks as CI):

```bash
nix flake check --all-systems
```

## Requirements

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

## Contributing

- **Issues:** [GitHub Issues](https://github.com/voidtek/nixpkgs/issues)
- **PRs:** [Pull Requests](https://github.com/voidtek/nixpkgs/pulls)
- **License:** MIT

---

*Built with Nix flakes*
