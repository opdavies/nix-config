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

        extraDomainNames = [
          "code.oliverdavies.uk"
          "jellyfin.oliverdavies.uk"
          "nixedo.oliverdavies.uk"
          "www.oliverdavies.uk"
        ];
      };
    };
  };
}
