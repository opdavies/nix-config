{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation {
  pname = "passmenu-otp";
  version = "unstable-2019-04-21";

  src = fetchFromGitHub {
    owner = "petrmanek";
    repo = "passmenu-otp";
    rev = "2623a0845cc2bb68b636a743862693fce9ec8b02";
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
