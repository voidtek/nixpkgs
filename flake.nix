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
    # Restrict to supported systems: current Nixpkgs no longer supports
    # x86_64-darwin, which would break `nix flake check --all-systems`.
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

          # Each profile adds packages on top of the common tools.
          profiles = {
            default = {
              description = "Basic dev tools";
              packages = [ ];
            };

            python = {
              description = "Python development";
              # Language tooling only; project libraries are managed with `uv`.
              packages = with pkgs; [
                python-launcher
                python3Packages.pylint
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

            hugo = {
              description = "Hugo & static sites";
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
              ];
            };

            security = {
              description = "Security auditing";
              packages = with pkgs; [
                osv-scanner
                pip-audit
                gitleaks
                nmap
              ];
            };
          };

          # Common tools available in every profile.
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
            uv
          ];

          # Prefix the prompt with the active profile name.
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

          # Drop into Fish automatically; opt out with NIXPKGS_NO_FISH=1.
          fishLaunch = ''
            if [ -z "''${NIXPKGS_NO_FISH:-}" ] \
              && command -v fish >/dev/null 2>&1 \
              && [ "$SHELL" != "$(command -v fish)" ]; then
              exec fish
            fi
          '';

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

          # Pin the formatting check to x86_64-linux: it is platform-independent,
          # and defining it per-system would make `--all-systems` try to build
          # the aarch64 variant on the x86_64 CI runner and fail.
          checks = lib.optionalAttrs (system == "x86_64-linux") {
            formatting = pkgs.runCommand "check-formatting" { nativeBuildInputs = [ pkgs.nixfmt ]; } ''
              nixfmt --check ${./flake.nix}
              touch $out
            '';
          };
        }
      );
}
