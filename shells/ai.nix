{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.python3Packages.jupyter
    pkgs.python3Packages.numpy
    pkgs.python3Packages.pandas
    pkgs.python3Packages.matplotlib
    pkgs.python3Packages.scikit-learn
    pkgs.python3Packages.requests
    pkgs.python3Packages.openai
  ];

  shellHook = ''
    ${shellCustom}

    echo ""
    echo " █████╗ ██╗"
    echo "██╔══██╗██║"
    echo "███████║██║"
    echo "██╔══██║██║"
    echo "██║  ██║██║"
    echo "╚═╝  ╚═╝╚═╝"
    echo ""
    echo "Welcome to the AI development environment!"
    echo ""

    ${fishLaunch}
  '';
}
