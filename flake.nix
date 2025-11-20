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
    in
    {
      devShells.${system} = {
        default = import ./shells/default.nix { inherit pkgs defaultPackages sshSetup; };
        python = import ./shells/python.nix { inherit pkgs defaultPackages sshSetup; };
        docker = import ./shells/docker.nix { inherit pkgs defaultPackages sshSetup; };
        hugo = import ./shells/hugo.nix { inherit pkgs defaultPackages sshSetup; };
        devops = import ./shells/devops.nix { inherit pkgs defaultPackages sshSetup; };
      };
    };
}