{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    certs = {
      "oliverdavies.uk" = {
        domain = "oliverdavies.uk";
        dnsProvider = "cloudflare";
        email = "oliver@oliverdavies.uk";
        environmentFile = config.age.secrets.cloudflare.path;
        webroot = null;

        extraDomainNames = [ "*.oliverdavies.uk" ];
      };
    };
  };
}
