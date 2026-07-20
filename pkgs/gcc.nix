{ stdenv, fetchurl, gnumake, perl, m4, gmp, mpfr, mpc }:

stdenv.mkDerivation {
  pname = "gcc-custom";
  version = "13.2.0";

  src = fetchurl {
    url = "mirror://gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.xz";
    hash = "sha256-4nXnZEKmBnNBon8Exca4PYYTFEAEwEE1KIY9xrXHQ9o=";
  };

  buildInputs = [ gmp mpfr mpc ];
  nativeBuildInputs = [ gnumake perl m4 ];

  configurePhase = ''
    mkdir ../build
    cd ../build
    $src/configure --prefix=$out --disable-multilib --enable-languages=c,c++
  '';

  buildPhase = ''
    make -j$NIX_BUILD_CORES
  '';

  installPhase = ''
    make install
  '';
}
