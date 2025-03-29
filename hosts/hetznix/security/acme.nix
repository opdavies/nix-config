{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      dnsProvider = "cloudflare";
      email = "oliver@oliverdavies.uk";
      environmentFile = config.age.secrets.cloudflare.path;
      webroot = null;
    };

    certs."oliverdavies.uk" = {
      domain = "oliverdavies.uk";

      extraDomainNames = [ "*.oliverdavies.uk" ];
    };
  };
}
