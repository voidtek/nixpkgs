{ pkgs, defaultPackages, sshSetup, shellCustom }:

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
  ];

  shellHook = ''
    ${sshSetup}
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
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, cacert, gnupg, opentofu, kubectl, talosctl, k9s, jq, helm, tflint, terraform-docs, kube-score, kubeconform, helm-docs, yamllint, awscli, renovate"
    echo ""
  '';
}