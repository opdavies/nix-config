{
  flake.modules.pc.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ xfce.tumbler ];
    };
}
