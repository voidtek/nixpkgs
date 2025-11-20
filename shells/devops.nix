{ pkgs, defaultPackages, sshSetup, shellCustom }:

pkgs.mkShell {
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
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, opentofu, kubectl, talosctl, k9s, jq, helm, tflint, terraform-docs, kube-score, kubeconform, helm-docs, yamllint"
    echo ""
  '';
}