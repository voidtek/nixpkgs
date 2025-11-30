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
      in
      {
        devShells = {
          default = import ./shells/default.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "default"; };
          python = import ./shells/python.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "python"; };
          docker = import ./shells/docker.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "docker"; };
          hugo = import ./shells/hugo.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "hugo"; };
          devops = import ./shells/devops.nix { inherit pkgs defaultPackages; shellCustom = shellCustom "devops"; };
        };
      }
    );
}
