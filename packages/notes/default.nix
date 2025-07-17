{ pkgs, ... }:

with pkgs;

stdenv.mkDerivation rec {
  pname = "notes";
  version = "unstable-2024-12-07";

  src = fetchFromGitHub {
    owner = "nickjj";
    repo = "notes";
    rev = "f4f0aab865c19132484a2c3998cd984bdb3b9514";
    sha256 = "sha256-y5SkS+22tW9wf3gH26NHSnrnJ0rkBWSgKvansP8Hlbg=";
  };

  buildInputs = [ bash ];

  installPhase = ''
    mkdir -p $out/bin
    cp notes $out/bin/notes
    chmod +x $out/bin/notes
  '';
}
