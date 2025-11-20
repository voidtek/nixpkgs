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
      ];
      
      sshSetup = ''
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/id_rsa 2>/dev/null
      '';
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = defaultPackages;
          
          shellHook = ''
            ${sshSetup}
            echo "Basic shell with wget, curl, and shellcheck available"
          '';
        };

        dev-python = pkgs.mkShell {
          buildInputs = defaultPackages ++ [
            pkgs.python3
            pkgs.python3Packages.pip
            pkgs.python-launcher
          ];

          shellHook = ''
            ${sshSetup}
            echo ""
            echo "██████╗ ███████╗██╗   ██╗    ██████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ███╗   ██╗"
            echo "██╔══██╗██╔════╝██║   ██║    ██╔══██╗╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗████╗  ██║"
            echo "██║  ██║█████╗  ██║   ██║    ██████╔╝ ╚████╔╝    ██║   ███████║██║   ██║██╔██╗ ██║"
            echo "██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔═══╝   ╚██╔╝     ██║   ██╔══██║██║   ██║██║╚██╗██║"
            echo "██████╔╝███████╗ ╚████╔╝     ██║        ██║      ██║   ██║  ██║╚██████╔╝██║ ╚████║"
            echo "╚═════╝ ╚══════╝  ╚═══╝      ╚═╝        ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
            echo ""
            echo "Welcome to the Python development environment!"
            echo "Available tools: wget, curl, shellcheck, python3, pip"
            echo ""
          '';
        };

        devops = pkgs.mkShell {
          buildInputs = defaultPackages ++ [
            pkgs.opentofu
            pkgs.kubectl
            pkgs.talosctl
            pkgs.k9s
            pkgs.jq
            pkgs.helm
            pkgs.tflint
            pkgs.terraform-docs
            pkgs.kube-score
            pkgs.kubeconform
            pkgs.helm-docs
          ];

          shellHook = ''
            ${sshSetup}
            echo ""
            echo "██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗"
            echo "██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝"
            echo "██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗"
            echo "██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║"
            echo "██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║"
            echo "╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝"
            echo ""
            echo "Welcome to the DevOps development environment!"
            echo "Available tools: wget, curl, shellcheck, opentofu, kubectl, talosctl, k9s, jq, helm, tflint, terraform-docs, kube-score, kubeconform, helm-docs"
            echo ""
          '';
        };
      };
    };
}