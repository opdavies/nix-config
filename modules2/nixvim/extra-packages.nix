{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPackages = with pkgs; [
        nixfmt-rfc-style
        stylua
      ];
    };
}
