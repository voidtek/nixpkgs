{ pkgs, defaultPackages, sshSetup }:

pkgs.mkShell {
  buildInputs = defaultPackages;
  
  shellHook = ''
    ${sshSetup}
    echo "Basic shell with wget, curl, shellcheck, unzip, htop, btop, and nano available"
  '';
}