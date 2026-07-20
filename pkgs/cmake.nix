{ stdenv, fetchFromGitHub, ninja, python3, openssl }:

stdenv.mkDerivation {
  pname = "cmake-custom";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "Kitware";
    repo = "CMake";
    rev = "v4.0.0";
    hash = "sha256-p9R2SPKQem9Np24EalY6t24xE469SJNu7t1yxDvCbuc=";
  };

  nativeBuildInputs = [
    ninja
    python3
  ];

  buildInputs = [
    openssl
  ];

  configurePhase = ''
    ./bootstrap \
    --prefix=$out \
    --parallel=$NIX_BUILD_CORES \
    -- \
    -DOPENSSL_ROOT_DIR=${openssl}
  '';

  buildPhase = ''
    ninja
  '';

  installPhase = ''
    ninja install
  '';

}
