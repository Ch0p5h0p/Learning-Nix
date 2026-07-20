{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "sqlite-custom";
  version = "3.50.0";

  src = fetchurl {
    url = "https://www.sqlite.org/2025/sqlite-autoconf-3500000.tar.gz";
    hash = "sha256-O8d2pfJDiXQV87gPt02zI2UB1FGUx1x/aQEuTsASgyc=";
  };

  configurePhase = ''
    ./configure --prefix=$out
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
