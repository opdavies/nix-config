{ config, ... }:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "oliver@oliverdavies.uk";
    defaults.environmentFile = config.age.secrets.cloudflare.path;

    certs."oliverdavies.uk" = {
      domain = "oliverdavies.uk";
      dnsProvider = "cloudflare";
      webroot = null;

      extraDomainNames = [
        # TODO Refactor to use a wildcard certificate.
        "2020.oliverdavies.uk"
        "bootstrap-with-tailwind.oliverdavies.uk"
        "florida-drupalcamp-tailwind-css.oliverdavies.uk"
        "luke.oliverdavies.uk"
        "phpsw-sculpin-demo.oliverdavies.uk"
        "rebuilding-acquia.oliverdavies.uk"
        "rebuilding-bartik.oliverdavies.uk"
        "rebuilding-bristol-js.oliverdavies.uk"
        "rebuilding-symfony.oliverdavies.uk"
        "tailwindcss-demo.oliverdavies.uk"
        "talking-drupal-tailwindcss.oliverdavies.uk"
        "tome.oliverdavies.uk"
        "wp-tailwind.oliverdavies.uk"
        "www.oliverdavies.uk"
        "zet.oliverdavies.uk"
      ];
    };
  };
}
