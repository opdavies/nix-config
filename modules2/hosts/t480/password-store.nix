{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      programs.password-store.extensions = with pkgs.passExtensions; [
        pass-audit
        pass-otp
        pass-update
      ];
    };
}
