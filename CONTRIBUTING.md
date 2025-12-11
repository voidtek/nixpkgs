# Contributing

## 🚀 Quick Start

1. **Fork & Clone**
   ```bash
   git clone https://github.com/voidtek/nixpkgs.git
   cd nixpkgs
   ```

2. **Test Changes**
   ```bash
   nix develop .#devops  # Test your changes
   ```

## 📝 Guidelines

### Adding New Environments
1. Create `shells/newenv.nix`
2. Add to `flake.nix` devShells
3. Update README.md table
4. Test with `nix develop .#newenv`

### Adding Packages
- Add to `defaultPackages` (all environments)
- Or add to specific shell file (single environment)

### Code Style
- Use 2-space indentation
- Keep shell files under 50 lines
- Add welcome banners for new environments

## 🧪 Testing

```bash
# Test all environments
nix develop .#default
nix develop .#python
nix develop .#docker
nix develop .#hugo
nix develop .#devops
```

## 📋 Pull Request Process

1. Update CHANGELOG.md
2. Test all environments
3. Update documentation if needed
4. Submit PR with clear description

## 🐛 Issues

- Use GitHub Issues for bugs
- Include Nix version and OS
- Provide reproduction steps
