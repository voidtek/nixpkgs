# Scripts

Utility scripts for managing and monitoring the nixpkgs flake.

## install.sh

Automated installation script for Nix and dependencies.

### Usage

```bash
# Run directly from GitHub
curl -fsSL https://raw.githubusercontent.com/voidtek/nixpkgs/main/scripts/install.sh | bash

# Or run locally
./scripts/install.sh
```

### Features

- Detects OS automatically (Ubuntu/Debian, Fedora/RHEL, Arch Linux)
- Installs Git if not present
- Installs Nix with flakes enabled
- Configures Nix daemon
- Optional Docker installation
- Adds user to docker group

### Requirements

- `curl` - For downloading Nix installer
- `sudo` - For system-level installations
- Supported OS: Ubuntu, Debian, Fedora, RHEL, CentOS, Arch, Manjaro

## check-versions.sh

Compares Nix package versions with the latest upstream releases from GitHub and official APIs.

### Usage

```bash
# Run from project root
./scripts/check-versions.sh

# Or from scripts directory
cd scripts && ./check-versions.sh
```

### Requirements

- `curl` - For API requests
- `jq` - For JSON parsing
- `nix` - For querying package versions

All requirements are included in the default profile.

### Output

The script displays version comparisons with visual indicators:

- ✅ **Up to date**: Nix version matches latest release
- ⚠️ **Version difference**: Nix version differs from latest
- ❓ **Unknown**: Version information unavailable

### Coverage

Checks all packages across profiles:
- **Default**: wget, curl, shellcheck, htop, btop, ncdu
- **Python**: python3 and development packages
- **Docker**: docker, docker-compose, docker-buildx
- **Hugo**: hugo, nodejs, git, go
- **DevOps**: opentofu, kubectl, talosctl, k9s, jq, helm, tflint, terraform-docs, kube-score, kubeconform, helm-docs, yamllint, awscli

### Data Sources

- **GitHub API**: `https://api.github.com/repos/{owner}/{repo}/releases/latest`
- **Node.js API**: `https://nodejs.org/dist/index.json`
- **Python API**: GitHub releases for CPython

### Limitations

- Some packages may not have GitHub releases (marked as "unknown")
- Version format differences between Nix and upstream may cause false positives
- API rate limits may affect results for large numbers of requests