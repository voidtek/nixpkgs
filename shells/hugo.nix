{ pkgs, defaultPackages, shellCustom }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.hugo
    pkgs.nodejs
    pkgs.go
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "██╗  ██╗██╗   ██╗ ██████╗  ██████╗"
    echo "██║  ██║██║   ██║██╔════╝ ██╔═══██╗"
    echo "███████║██║   ██║██║  ███╗██║   ██║"
    echo "██╔══██║██║   ██║██║   ██║██║   ██║"
    echo "██║  ██║╚██████╔╝╚██████╔╝╚██████╔╝"
    echo "╚═╝  ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝"
    echo ""
    echo "Welcome to the Hugo development environment!"
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, ncdu, cacert, gnupg, git, hugo, nodejs, go"
    echo ""
  '';
}
