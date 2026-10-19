# Contributing

Thanks for your interest in contributing! This project provides reproducible
development environments as a Nix flake.

## 🚀 Quick Start

1. **Fork & clone** the repository, then enter it:

   ```bash
   git clone <your-fork-url>
   cd <repo>
   ```

2. **Enter an environment** to test your changes:

   ```bash
   nix develop .#<profile>
   ```

   List the available profiles with:

   ```bash
   nix flake show
   ```

## 🏗️ Architecture

Everything lives in a single `flake.nix`; there are no per-profile files.

- **`profiles`** — the single source of truth. Each entry has a `description`
  and a `packages` list. Dev shells are generated from it with `mapAttrs`.
- **`commonPackages`** — tools added to *every* profile.
- **`mkDevShell`** — builds a shell (prompt prefix, welcome message, Fish
  launch) from a profile definition.

## 📝 Guidelines

### Adding a new environment

Add an entry to the `profiles` attrset in `flake.nix`:

```nix
<name> = {
  description = "Short description";
  packages = with pkgs; [
    somePackage
    anotherPackage
  ];
};
```

The dev shell is generated automatically — no new file is required. If the
project documents its environments (e.g. a table in `README.md`), update it too.

### Adding packages

- A tool needed everywhere → add it to `commonPackages`.
- A tool for a single environment → add it to that profile's `packages`.

Avoid duplicating a package that is already in `commonPackages`.

### Code style

- Nix code is formatted with [`nixfmt`](https://github.com/NixOS/nixfmt).
- Run `nix fmt` before committing.
- Keep the flake evaluating on every supported system.

## 🧪 Testing

Run the same checks CI runs:

```bash
# Evaluate every dev shell and run all checks on every supported system
nix flake check --all-systems

# Or enter a specific environment
nix develop .#<profile>
```

> Tip: export `NIXPKGS_NO_FISH=1` before `nix develop` to stay in your current
> shell instead of dropping into Fish.

## 🤖 Continuous Integration

Every push and pull request is validated by GitHub Actions
(`.github/workflows/ci.yml`), which:

- installs Nix with flakes enabled,
- checks the health of `flake.lock`,
- runs `nix flake check --all-systems` (evaluation + formatting check),
- builds every dev shell (matrix generated from the flake itself).

Please make sure `nix flake check` passes locally before opening a PR.

## 📋 Pull Request process

1. Run `nix fmt` and `nix flake check`.
2. Update documentation if you changed the available environments.
3. Open a PR with a clear description of the change and how you tested it.

## 🐛 Issues

- Use the issue tracker for bugs and feature requests.
- Include your Nix version (`nix --version`) and operating system.
- Provide clear reproduction steps.
