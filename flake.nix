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
        default = pkgs.mkShell {
          buildInputs = defaultPackages;
          
          shellHook = ''
            ${sshSetup}
            echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, and nano available"
          '';
        };

        python = pkgs.mkShell {
          buildInputs = defaultPackages ++ [
            pkgs.python3
            pkgs.python3Packages.pip
            pkgs.python-launcher
            pkgs.python3Packages.pylint
            pkgs.python3Packages.jinja2
            pkgs.python3Packages.python-gitlab
            pkgs.python3Packages.requests
            pkgs.python3Packages.pyyaml
            pkgs.python3Packages.beautifulsoup4
            pkgs.python3Packages.tabulate
            pkgs.python3Packages.gitpython
            pkgs.python3Packages.python-hcl2
            pkgs.python3Packages.boto3
            pkgs.python3Packages.atlassian-python-api
            pkgs.python3Packages.pygithub
          ];

          shellHook = ''
            ${sshSetup}
            echo ""
            echo "██████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ███╗   ██╗"
            echo "██╔══██╗╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗████╗  ██║"
            echo "██████╔╝ ╚████╔╝    ██║   ███████║██║   ██║██╔██╗ ██║"
            echo "██╔═══╝   ╚██╔╝     ██║   ██╔══██║██║   ██║██║╚██╗██║"
            echo "██║        ██║      ██║   ██║  ██║╚██████╔╝██║ ╚████║"
            echo "╚═╝        ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
            echo ""
            echo "Welcome to the Python development environment!"
            echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, python3, pip, pylint + Python packages"
            echo ""
          '';
        };

        docker = pkgs.mkShell {
          buildInputs = defaultPackages ++ [
            pkgs.docker
            pkgs.docker-compose
          ];

          shellHook = ''
            ${sshSetup}
            echo ""
            echo "██████╗  ██████╗  ██████╗██╗   ██╗███████╗██████╗"
            echo "██╔══██╗██╔═══██╗██╔════╝██║ ███╔╝██╔════╝██╔══██╗"
            echo "██║  ██║██║   ██║██║     ████╔╝   █████╗  ██████╔╝"
            echo "██║  ██║██║   ██║██║     ██╔═███╗ ██╔══╝  ██╔══██╗"
            echo "██████╔╝╚██████╔╝ ██████╗██║  ╚██╗███████╗██║  ██║"
            echo "╚═════╝  ╚═════╝  ╚═════╝╚═╝   ╚═╝╚══════╝╚═╝  ╚═╝"
            echo ""
            echo "Welcome to the Docker development environment!"
            echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, docker, docker-compose"
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
            pkgs.yamllint
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
            echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, opentofu, kubectl, talosctl, k9s, jq, helm, tflint, terraform-docs, kube-score, kubeconform, helm-docs, yamllint"
            echo ""
          '';
        };
      };
    };
}