{
  description = "DevOps dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      defaultPackages = [
        pkgs.wget
        pkgs.curl
        pkgs.shellcheck
        pkgs.unzip
        pkgs.htop
        pkgs.btop
        pkgs.nano
      ];
      
      sshSetup = ''
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/id_rsa 2>/dev/null
      '';
      
      shellCustom = profileName: ''
        export NIXPKGS_PROFILE="${profileName}"
        case "$TERM" in
            xterm-color|*-256color) color_prompt=yes;;
        esac
        if [ "$color_prompt" = yes ]; then
          export PS1="\[\033[90m\][$NIXPKGS_PROFILE]\[\033[0m\]$PS1"
        else
          export PS1="[$NIXPKGS_PROFILE]$PS1"
        fi
      '';
    in
    {
      devShells.${system} = {
        default = import ./shells/default.nix { inherit pkgs defaultPackages sshSetup; shellCustom = shellCustom "default"; };
        python = import ./shells/python.nix { inherit pkgs defaultPackages sshSetup; shellCustom = shellCustom "python"; };
        docker = import ./shells/docker.nix { inherit pkgs defaultPackages sshSetup; shellCustom = shellCustom "docker"; };
        hugo = import ./shells/hugo.nix { inherit pkgs defaultPackages sshSetup; shellCustom = shellCustom "hugo"; };
        devops = import ./shells/devops.nix { inherit pkgs defaultPackages sshSetup; shellCustom = shellCustom "devops"; };
      };
    };
}