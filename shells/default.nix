{ pkgs, defaultPackages, sshSetup, shellCustom }:

pkgs.mkShellNoCC {
  packages = defaultPackages;
  
  shellHook = ''
    ${sshSetup}
    ${shellCustom}
    echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, nano, cacert, gnupg, ncdu, git available"
  '';
}