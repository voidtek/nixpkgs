{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.python-launcher
    pkgs.python3Packages.pylint
    pkgs.python3Packages.jinja2
    pkgs.python3Packages.python-gitlab
    pkgs.python3Packages.requests
    pkgs.python3Packages.pyyaml
    pkgs.python3Packages.beautifulsoup4
    pkgs.python3Packages.tabulate
    pkgs.python3Packages.gitpython
    pkgs.python3Packages.python-hcl2
    pkgs.python3Packages.boto3
    pkgs.python3Packages.atlassian-python-api
    pkgs.python3Packages.pygithub
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "██████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ███╗   ██╗"
    echo "██╔══██╗╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗████╗  ██║"
    echo "██████╔╝ ╚████╔╝    ██║   ███████║██║   ██║██╔██╗ ██║"
    echo "██╔═══╝   ╚██╔╝     ██║   ██╔══██║██║   ██║██║╚██╗██║"
    echo "██║        ██║      ██║   ██║  ██║╚██████╔╝██║ ╚████║"
    echo "╚═╝        ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
    echo ""
    echo "Welcome to the Python development environment!"
    echo ""

    ${fishLaunch}
  '';
}
