{ stdenv, fetchurl, zlib, openssl, sqlite, libffi }:

stdenv.mkDerivation {
  pname = "python3-custom";
  version = "3.13.0";

  src = fetchurl {
    url = "https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tar.xz";
    hash = "sha256-CG3liC48sxDU3KSEV1IuLkgBjs1D2pzfgn9qB1nvsH0=";
  };

  buildInputs = [
    zlib
    openssl
    sqlite
    libffi
  ];

  configurePhase = ''
    ./configure \
    --prefix=$out \
    --with-openssl=${openssl}
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
