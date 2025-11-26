{ pkgs, defaultPackages, sshSetup, shellCustom }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.hugo
    pkgs.nodejs
    pkgs.git
    pkgs.go
  ];
  
  shellHook = ''
    ${sshSetup}
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
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, hugo, nodejs, git, go"
    echo ""
  '';
}