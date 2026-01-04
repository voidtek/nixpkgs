{
  description = "DevOps dev shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        defaultPackages = with pkgs; [
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
          neofetch
          (writeShellScriptBin "nixhelp" (builtins.readFile ./scripts/nixhelp))
        ];

        shellCustom = profileName: ''
          export NIXPKGS_PROFILE="${profileName}"
          case "$TERM" in
              xterm-color|*-256color) color_prompt=yes;;
          esac
          if [ "$color_prompt" = yes ]; then
            export PS1="\[\033[90m\][$NIXPKGS_PROFILE]\[\033[0m\] $PS1"
          else
            export PS1="[$NIXPKGS_PROFILE] $PS1"
          fi
        '';

        fishLaunch = ''
          # Launch Fish if available and not already in Fish
          if command -v fish >/dev/null 2>&1 && [ "$SHELL" != "$(command -v fish)" ]; then
            exec fish
          fi
        '';
      in
      {
        devShells = {
          default = import ./shells/default.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "default"; inherit fishLaunch; };
          python = import ./shells/python.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "python"; inherit fishLaunch; };
          docker = import ./shells/docker.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "docker"; inherit fishLaunch; };
          hugo = import ./shells/hugo.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "hugo"; inherit fishLaunch; };
          devops = import ./shells/devops.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "devops"; inherit fishLaunch; };
          ai = import ./shells/ai.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "ai"; inherit fishLaunch; };
          kotlin = import ./shells/kotlin.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "kotlin"; inherit fishLaunch; };
        };
      }
    );
}
