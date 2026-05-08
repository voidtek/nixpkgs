{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.osv-scanner
    pkgs.python3Packages.pip-audit
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██╗   ██╗"
    echo "██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝"
    echo "███████╗█████╗  ██║     ██║   ██║██████╔╝██║   ██║    ╚████╔╝ "
    echo "╚════██║██╔══╝  ██║     ██║   ██║██╔══██╗██║   ██║     ╚██╔╝  "
    echo "███████║███████╗╚██████╗╚██████╔╝██║  ██║██║   ██║      ██║   "
    echo "╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   "
    echo ""
    echo "Welcome to the Security audit environment!"
    echo ""

    ${fishLaunch}
  '';
}
