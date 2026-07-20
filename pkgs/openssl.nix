{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "openssl-custom";
  version = "3.5.0";

  src = fetchurl {
    url = "https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz";
    hash = "";
  };

  configurePhase = ''
    ./Configure \
    --prefix=$out \
    --openssldir=$out/etc/ssl \
    linux-x86_64
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install_sw
  '';
}
