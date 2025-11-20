{ pkgs, defaultPackages, sshSetup, shellCustom }:

pkgs.mkShell {
  buildInputs = defaultPackages;
  
  shellHook = ''
    ${sshSetup}
    ${shellCustom}
    echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, and nano available"
  '';
}