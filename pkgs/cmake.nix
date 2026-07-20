{ stdenv, fetchFromGitHub, python3, openssl }:

stdenv.mkDerivation {
  pname = "cmake-custom";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "Kitware";
    repo = "CMake";
    rev = "v4.0.0";
    hash = "sha256-p9R2SPKQem9Np24EalY6t24xE469SJNu7t1yxDvCbuc=";
  };

  buildInputs = [
    python3
    openssl
  ];

  configurePhase = ''
    export OPENSSL_ROOT_DIR=${openssl}

    ./bootstrap \
    --prefix=$out \
    --parallel=$NIX_BUILD_CORES
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';

}
