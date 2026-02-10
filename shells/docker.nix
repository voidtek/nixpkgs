{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
    pkgs.hadolint
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
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, docker, docker-compose, docker-buildx, hadolint"
    echo ""

    ${fishLaunch}
  '';
}
