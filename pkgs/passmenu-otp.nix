{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "passmenu-otp";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "petrmanek";
    repo = "passmenu-otp";
    rev = "master";
    sha256 = "sha256-2EGomeK/p3uVfgho5xGR11ovJQ2q3cPZoFG+z88DyxA=";
  };

  buildInputs = [
    pass
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp passmenu-otp $out/bin/passmenu-otp
    chmod +x $out/bin/passmenu-otp
  '';

  meta = {
    homepage = "https://github.com/petrmanek/passmenu-otp";
    mainProgram = "passmenu-otp";
  };
}
