{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.writeShellApplication {
          name = "heightwidth";

          runtimeInputs = [ pkgs.ffmpeg ];

          # https://github.com/rwxrob/dot/blob/main/scripts/heightwidth.
          text = ''
            ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=noprint_wrappers=1 "$1"
          '';
        })
      ];
    };
}
