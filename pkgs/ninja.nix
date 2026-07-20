{ stdenv, fetchFromGitHub, python3 }:

stdenv.mkDerivation {
  pname = "ninja-custom";
  version = "1.12.1";

  src = fetchFromGitHub {
    owner = "ninja-build";
    repo = "ninja";
    rev = "v1.12.1";
    hash = "sha256-RT5u+TDvWxG5EVQEYj931EZyrHUSAqK73OKDAascAwA=";
  };

  nativeBuildInputs = [ python3 ];

  buildPhase = ''
    python3 configure.py --bootstrap
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 ninja $out/bin/ninja
  '';
}
