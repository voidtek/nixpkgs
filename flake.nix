{
  description = "DevOps dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.opentofu
          pkgs.kubectl
          pkgs.talosctl
          pkgs.k9s
          pkgs.nodejs
        ];
      };
    };
}
