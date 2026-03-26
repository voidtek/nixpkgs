{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.opentofu
    pkgs.kubectl
    pkgs.talosctl
    pkgs.k9s
    pkgs.jq
    pkgs.kubernetes-helm
    pkgs.tflint
    pkgs.terraform-docs
    pkgs.kube-score
    pkgs.kubeconform
    pkgs.helm-docs
    pkgs.yamllint
    pkgs.awscli2
    pkgs.renovate
    pkgs.updatecli
    pkgs.glab
    pkgs.jsonnet
    pkgs.jsonnet-bundler
    pkgs.dnsutils
    pkgs.nmap
  ];

  shellHook = ''
    ${shellCustom}

    echo ""
    echo "██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗"
    echo "██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝"
    echo "██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗"
    echo "██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║"
    echo "██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║"
    echo "╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝"
    echo ""
    echo "Welcome to the DevOps development environment!"
    echo ""

    ${fishLaunch}
  '';
}
