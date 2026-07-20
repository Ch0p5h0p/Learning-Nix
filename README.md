# Learning Nix

At the continued "advising" of one of my friends, I was told that NixOS is better than Arch. Unfortunately for them, I very much like Arch. Nix interested me though, so I picked up a little bit of it in around an hour or two on a Sunday afternoon.

I decided that it was a reasonable test of what I've learned to try to compile a package with derivations. Unfortunately, I'm a little bit stupid, so I decided to compile GCC. GCC was a bit weird, so in my *clearly* infinite wisdom, I chose to go to Clang. Somebody save me.

As of now, everything is entirely built in custom derivations, except for stdenv, fetchurl, fetchFromGitHub, and the perl dependency from OpenSSL.

**COMPILE AT YOUR OWN RISK!!!** (I babysat this as it compiled and built in `nix develop` from midnight to close to 3 AM. LLVM is a tortoise.)

## Test Status:
- [x] zlib
- [x] libffi
- [x] SQLite
- [x] OpenSSL
- [x] Python 3
- [x] Ninja
- [x] CMake
- [x] LLVM
- [x] Clang
