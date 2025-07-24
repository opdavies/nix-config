{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      fonts = {
        fontconfig.enable = true;

        packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          nerd-fonts.meslo-lg
          terminus_font
          terminus_font_ttf
        ];
      };
    };
}
