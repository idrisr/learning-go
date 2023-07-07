{
  inputs.nixpkgs.url = "nixpkgs";
  description = "Book: Learning Go";
  outputs = { nixpkgs, self, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system} = with pkgs; rec {
        godev = mkShell { buildInputs = [ go gopls ]; };
        default = godev;
      };
    };
}
