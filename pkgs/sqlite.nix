{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "sqlite-custom";
  version = "3.50.0";

  src = fetchurl {
    url = "https://www.sqlite.org/2025/sqlite-autoconf-3500000.tar.gz";
    hash = "";
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
