{ stdenv, llvm }:

stdenv.mkDerivation {
  pname = "clang-custom";
  version = "20.1.0";

  src = llvm.src;

  sourceRoot = "source/clang-custom";

  buildInputs = [
    llvm
  ];
}
