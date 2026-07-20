{ stdenv, fetchFromGitHub, cmake, ninja, python3, zlib }:

stdenv.mkDerivation {
  pname = "llvm-custom";
  version = "20.1.0";

  src = fetchFromGitHub {
    owner = "llvm";
    repo = "llvm-project";
    rev = "llvmorg-20.1.0";
    hash = "sha256-86Z8e4ubnHJc1cYHjYPLeQC9eoPF417HYtqg8NAzxts=";
  };

  sourceRoot = "source/llvm";

  nativeBuildInputs = [
    cmake
    ninja
    python3
  ];

  buildInputs = [
    zlib
  ];

  cmakeFlags = [
    "-DLLVM_ENABLE_PROJECTS=clang"
    "-DLLVM_TARGETS_TO_BUILD=X86"
    "-DCMAKE_BUILD_TYPE=Release"
  ];
}
