{
  services = {
    jitsi-meet = {
      enable = true;
      caddy.enable = true;
      nginx.enable = false;
      secureDomain.enable = true;

      hostName = "meet.oliverdavies.uk";

      prosody = {
        enable = true;
        lockdown = true;
      };

      jicofo = {
        enable = true;
      };
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "jitsi-meet-1.0.8043"
  ];
}
