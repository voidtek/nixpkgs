{ pkgs, defaultPackages, shellCustom, fishLaunch }:

pkgs.mkShellNoCC {
  packages = defaultPackages ++ [ pkgs.fish ];

  shellHook = ''
    ${shellCustom}
    echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, nano, cacert, gnupg, ncdu, git, kiro-cli available"

    ${fishLaunch}
  '';
}
