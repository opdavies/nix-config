{
  flake.modules = {
    nixos.pc =
      { pkgs, ... }:
      {
        security.pam.services.login.gnupg.enable = true;

        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;

          pinentryPackage = pkgs.pinentry-qt;
        };
      };

    homeManager.base.home.file.".gnupg/gpg-agent.conf".text = ''
      allow-preset-passphrase
      default-cache-ttl 600
      max-cache-ttl 7200
      enable-ssh-support
    '';
  };
}
