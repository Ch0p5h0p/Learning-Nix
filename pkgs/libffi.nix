{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "libffi-custom";
  version = "3.4.6";

  src = fetchurl {
    url = "https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz";
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
