{
  description = "A custom GCC compiler built via Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      packages.${system} = rec {
        deps = import ./pkgs/dependencies.nix {
          stdenv = pkgs.stdenv;
          fetchurl = pkgs.fetchurl;
        };

        default = import ./pkgs/gcc.nix {
          stdenv = pkgs.stdenv;
          fetchurl = pkgs.fetchurl;
          gnumake = pkgs.gnumake;
          perl = pkgs.perl;
          m4 = pkgs.m4;
          gmp = deps.gmp;
          mpfr = deps.mpfr;
          mpc = deps.mpc;
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ self.packages.${system}.default ];
      };
    };
}
