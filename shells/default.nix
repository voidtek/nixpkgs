{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages;

  shellHook = ''
    ${shellCustom}
    echo "Welcome to the default development environment!"

    ${fishLaunch}
  '';
}
