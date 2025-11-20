{ pkgs, defaultPackages, sshSetup, shellCustom }:

pkgs.mkShell {
  buildInputs = defaultPackages ++ [
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
  ];

  shellHook = ''
    ${sshSetup}
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