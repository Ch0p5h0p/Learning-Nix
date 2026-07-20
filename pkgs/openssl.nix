{ stdenv, fetchurl, perl }:

stdenv.mkDerivation {
  pname = "openssl-custom";
  version = "3.5.0";

  src = fetchurl {
    url = "https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz";
    hash = "sha256-NE0KefGpsIApsHROLMQBpD+ckKzRBE0JpTC0iFqOn8A=";
  };

  nativeBuildInputs = [
    perl
  ];

  patchPhase = ''
    patchShebangs .
  '';

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
