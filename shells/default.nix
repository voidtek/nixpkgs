{ pkgs, defaultPackages, shellCustom }:

pkgs.mkShellNoCC {
  packages = defaultPackages;
  
  shellHook = ''
    ${shellCustom}
    echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, nano, cacert, gnupg, ncdu, git available"
  '';
}
