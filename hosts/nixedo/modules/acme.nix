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
          "2020.oliverdavies.uk"
          "bootstrap-with-tailwind.oliverdavies.uk"
          "code.oliverdavies.uk"
          "eric.oliverdavies.uk"
          "florida-drupalcamp-tailwind-css.oliverdavies.uk"
          "jellyfin.oliverdavies.uk"
          "luke.oliverdavies.uk"
          "nixedo.oliverdavies.uk"
          "phpsw-sculpin-demo.oliverdavies.uk"
          "rebuilding-acquia.oliverdavies.uk"
          "rebuilding-bartik.oliverdavies.uk"
          "rebuilding-bristol-js.oliverdavies.uk"
          "rebuilding-symfony.oliverdavies.uk"
          "tailwindcss-demo.oliverdavies.uk"
          "talking-drupal-tailwindcss.oliverdavies.uk"
          "wp-tailwind.oliverdavies.uk"
          "www.oliverdavies.uk"
          "zet.oliverdavies.uk"
        ];
      };
    };
  };
}
