{
  description = "Reproducible development environments with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    # Restrict to the systems we actually support (see README). This keeps
    # `nix flake check --all-systems` green: e.g. current Nixpkgs no longer
    # supports x86_64-darwin.
    flake-utils.lib.eachSystem
      [
        "x86_64-linux"
        "aarch64-linux"
      ]
      (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = pkgs.lib;

          # ── Profile definitions ────────────────────────────────────────────
          # Single source of truth: each profile declares a description and the
          # extra packages it adds on top of the common tools. Dev shells are
          # generated from this set (see `mkDevShell` below).
          profiles = {
            default = {
              description = "Basic dev tools";
              packages = [ ];
            };

            python = {
              description = "Python development";
              packages = with pkgs; [
                python-launcher
                python3Packages.pylint
                python3Packages.jinja2
                python3Packages.python-gitlab
                python3Packages.requests
                python3Packages.pyyaml
                python3Packages.beautifulsoup4
                python3Packages.tabulate
                python3Packages.gitpython
                python3Packages.python-hcl2
                python3Packages.boto3
                python3Packages.atlassian-python-api
                python3Packages.pygithub
              ];
            };

            docker = {
              description = "Containerization";
              packages = with pkgs; [
                docker
                docker-compose
                docker-buildx
                hadolint
                crane
              ];
            };

            web = {
              description = "Web & static sites";
              packages = with pkgs; [
                hugo
                go
                libwebp
                imagemagick
              ];
            };

            devops = {
              description = "Infrastructure";
              packages = with pkgs; [
                opentofu
                kubectl
                talosctl
                k9s
                jq
                kubernetes-helm
                tflint
                terraform-docs
                kube-score
                kubeconform
                helm-docs
                yamllint
                awscli2
                renovate
                updatecli
                glab
                jsonnet
                jsonnet-bundler
                dnsutils
                nmap
              ];
            };

            security = {
              description = "Security auditing";
              packages = with pkgs; [
                osv-scanner
                pip-audit
              ];
            };
          };

          # ── Common tools (available in every profile) ──────────────────────
          commonPackages = with pkgs; [
            fish
            wget
            curl
            shellcheck
            unzip
            htop
            btop
            nano
            cacert
            gnupg
            ncdu
            git
            fastfetch
            nodejs
            yq
            bitwarden-cli
            python3
            python3Packages.pip
            uv
          ];

          # ── Shell hook helpers ──────────────────────────────────────────────
          # Adds a "[profile]" prefix to the prompt so the active environment is
          # always visible.
          promptHook = profileName: ''
            export NIXPKGS_PROFILE="${profileName}"
            case "$TERM" in
            xterm-color | *-256color) color_prompt=yes ;;
            esac
            if [ "$color_prompt" = yes ]; then
              export PS1="\[\033[90m\][$NIXPKGS_PROFILE]\[\033[0m\] $PS1"
            else
              export PS1="[$NIXPKGS_PROFILE] $PS1"
            fi
          '';

          # Drop into Fish automatically, unless already running it. Opt out by
          # exporting NIXPKGS_NO_FISH=1 before `nix develop`.
          fishLaunch = ''
            if [ -z "''${NIXPKGS_NO_FISH:-}" ] \
              && command -v fish >/dev/null 2>&1 \
              && [ "$SHELL" != "$(command -v fish)" ]; then
              exec fish
            fi
          '';

          # ── Dev shell builder ───────────────────────────────────────────────
          mkDevShell =
            name: profile:
            pkgs.mkShellNoCC {
              packages = commonPackages ++ profile.packages;
              shellHook = ''
                ${promptHook name}
                echo ""
                echo "Welcome to the ${name} development environment! (${profile.description})"
                echo ""
                ${fishLaunch}
              '';
            };
        in
        {
          devShells = lib.mapAttrs mkDevShell profiles;

          formatter = pkgs.nixfmt;

          # `nix flake check` builds this to ensure flake.nix stays formatted.
          checks.formatting = pkgs.runCommand "check-formatting" { nativeBuildInputs = [ pkgs.nixfmt ]; } ''
            nixfmt --check ${./flake.nix}
            touch $out
          '';
        }
      );
}
