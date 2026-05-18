{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
    pkgs.hadolint
    pkgs.crane
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
    echo ""

    ${fishLaunch}
  '';
}
