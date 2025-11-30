{ pkgs, defaultPackages, shellCustom }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "██████╗  ██████╗  ██████╗██╗   ██╗███████╗██████╗"
    echo "██╔══██╗██╔═══██╗██╔════╝██║ ███╔╝██╔════╝██╔══██╗"
    echo "██║  ██║██║   ██║██║     ████╔╝   █████╗  ██████╔╝"
    echo "██║  ██║██║   ██║██║     ██╔═███╗ ██╔══╝  ██╔══██╗"
    echo "██████╔╝╚██████╔╝ ██████╗██║  ╚██╗███████╗██║  ██║"
    echo "╚═════╝  ╚═════╝  ╚═════╝╚═╝   ╚═╝╚══════╝╚═╝  ╚═╝"
    echo ""
    echo "Welcome to the Docker development environment!"
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, docker, docker-compose, docker-buildx"
    echo ""
  '';
}
