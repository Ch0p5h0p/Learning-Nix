{
  outputs = { self, nixpkgs }:
  let

    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    zlib = import ./pkgs/zlib.nix {
      inherit (pkgs) stdenv fetchurl;
    };

    libffi = import ./pkgs/libffi.nix {
      inherit (pkgs) stdenv fetchurl;
    };

    sqlite = import ./pkgs/sqlite.nix {
      inherit (pkgs) stdenv fetchurl;
    };

    openssl = import ./pkgs/openssl.nix {
      inherit (pkgs) stdenv fetchurl;
    };

    python3 = import ./pkgs/python3.nix {
      inherit (pkgs) stdenv fetchurl;
      inherit zlib libffi sqlite openssl;
    };

    ninja = import ./pkgs/ninja.nix {
      inherit (pkgs) stdenv fetchFromGitHub;
      inherit python3;
    };

    cmake = import ./pkgs/cmake.nix {
      inherit (pkgs) stdenv fetchFromGitHub openssl;
      inherit ninja python3;
    };

    llvm = import ./pkgs/llvm.nix {
      inherit (pkgs) stdenv fetchFromGitHub;
      inherit zlib cmake ninja python3;
    };

    clang = import ./pkgs/clang.nix {
      inherit (pkgs) stdenv;
      inherit llvm;
    };

    in {
      packages.x86_64-linux.default = clang;

      devShells.${system}.default =
        pkgs.mkShell {
          packages = [ clang ];
        };
    };
}
