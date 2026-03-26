{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.hugo
    pkgs.nodejs
    pkgs.go
    pkgs.libwebp
    pkgs.imagemagick
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "██╗    ██╗███████╗██████╗"
    echo "██║    ██║██╔════╝██╔══██╗"
    echo "██║ █╗ ██║█████╗  ██████╔╝"
    echo "██║███╗██║██╔══╝  ██╔══██╗"
    echo "╚███╔███╔╝███████╗██████╔╝"
    echo " ╚══╝╚══╝ ╚══════╝╚═════╝"
    echo ""
    echo "Welcome to the Web development environment!"
    echo ""

    ${fishLaunch}
  '';
}
