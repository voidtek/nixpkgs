{ pkgs, defaultPackages, sshSetup }:

pkgs.mkShell {
  buildInputs = defaultPackages ++ [
    pkgs.python3
    pkgs.python3Packages.pip
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
    ${sshSetup}
    echo ""
    echo "██████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ███╗   ██╗"
    echo "██╔══██╗╚██╗ ██╔╝╚══██╔══╝██║  ██║██╔═══██╗████╗  ██║"
    echo "██████╔╝ ╚████╔╝    ██║   ███████║██║   ██║██╔██╗ ██║"
    echo "██╔═══╝   ╚██╔╝     ██║   ██╔══██║██║   ██║██║╚██╗██║"
    echo "██║        ██║      ██║   ██║  ██║╚██████╔╝██║ ╚████║"
    echo "╚═╝        ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
    echo ""
    echo "Welcome to the Python development environment!"
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, python3, pip, pylint + Python packages"
    echo ""
  '';
}