# Scripts

## 📜 Available Scripts

### `install.sh`
Quick installation script for Nix with flakes support.

```bash
curl -fsSL https://raw.githubusercontent.com/voidtek/nixpkgs/main/scripts/install.sh | bash
```

**What it does:**
- Installs Nix package manager
- Enables flakes and nix-command features
- Configures trusted users
- Sets up Fish shell integration

## 🔧 Usage

All scripts are executable and can be run directly:

```bash
./scripts/install.sh
```

## 📋 Script Guidelines

- Make scripts executable (`chmod +x`)
- Add error handling with `set -e`
- Include help text with `-h` flag
- Test on clean systems before committing
