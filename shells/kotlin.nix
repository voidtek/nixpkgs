{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [
    pkgs.kotlin
    pkgs.gradle
    pkgs.openjdk21
    pkgs.android-studio
    pkgs.android-tools
  ];

  shellHook = ''
    ${shellCustom}
    echo ""
    echo "██╗  ██╗ ██████╗ ████████╗██╗     ██╗███╗   ██╗"
    echo "██║ ██╔╝██╔═══██╗╚══██╔══╝██║     ██║████╗  ██║"
    echo "█████╔╝ ██║   ██║   ██║   ██║     ██║██╔██╗ ██║"
    echo "██╔═██╗ ██║   ██║   ██║   ██║     ██║██║╚██╗██║"
    echo "██║  ██╗╚██████╔╝   ██║   ███████╗██║██║ ╚████║"
    echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝"
    echo ""
    echo "Welcome to the Kotlin development environment!"
    echo "Available tools: wget, curl, shellcheck, unzip, htop, btop, nano, ncdu, cacert, gnupg, git, kotlin, gradle, openjdk21, android-studio, android-tools"
    echo ""

    ${fishLaunch}
  '';
}
