{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        formatter = nixpkgs.legacyPackages.${system}.nixfmt;
        devShells.default = pkgs.mkShell {
          name = "tst";
          nativeBuildInputs = [
            pkgs.cowsay
          ];
        };
      });
}
