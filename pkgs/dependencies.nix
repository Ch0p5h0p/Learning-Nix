{ stdenv, fetchurl }:

rec {
  gmp = stdenv.mkDerivation {
    pname = "gmp";
    version = "6.3.0";
    src = fetchurl {
      url = "mirror://gnu/gmp/gmp-6.3.0.tar.xz";
      hash = "";
    };
  };

  mpfr = stdenv.mkDerivation {
    pname = "mpfr";
    version = "4.2.1";
    src = fetchurl {
      url = "mirror://gnu/mpfr/mpfr-4.2.1.tar.xz";
      hash = "";
    };
    buildInputs = [ gmp ];
  };

  mpc = stdenv.mkDerivation {
    pname = "mpc";
    version = "1.3.1";
    src = fetchurl {
      url = "mirror://gnu/mpc/mpc-1.3.1.tar.gz";
      hash = "";
    };
    buildInputs = [ gmp mpfr ];
  };
}
