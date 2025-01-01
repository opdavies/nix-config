{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    certs = {
      "opdavies.uk" = {
        domain = "opdavies.uk";
        dnsProvider = "cloudflare";
        email = "oliver@oliverdavies.uk";
        environmentFile = config.age.secrets.cloudflare-opdavies-uk.path;
        webroot = null;

        extraDomainNames = [ "*.opdavies.uk" ];
      };
    };
  };
}
