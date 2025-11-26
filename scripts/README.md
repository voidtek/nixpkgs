# Scripts

Utility scripts for managing and monitoring the nixpkgs flake.

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