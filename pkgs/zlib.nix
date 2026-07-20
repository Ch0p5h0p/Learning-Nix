{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "zlib-custom";
  version = "1.3.1";

  src = fetchurl {
    url = "https://zlib.net/fossils/zlib-1.3.1.tar.gz";
    hash = "sha256-mpOyt9/ax3zrpaVYpYDnRmfdb+3kWFuR7vtg8Dty3yM=";
  };

  configurePhase = ''
    ./configure --prefix=$out
  '';

  installPhase = ''
    make install
  '';
}
