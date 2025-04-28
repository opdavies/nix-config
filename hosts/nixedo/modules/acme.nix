{ config, ... }:

{
  security.acme =
    let
      email = "oliver@oliverdavies.uk";
    in
    {
      acceptTerms = true;

      defaults = { inherit email; };

      certs = {
        "oliverdavies.uk" = {
          inherit email;

          domain = "oliverdavies.uk";
          dnsProvider = "cloudflare";
          environmentFile = config.age.secrets.cloudflare.path;
          webroot = null;

          extraDomainNames = [
            "2020.oliverdavies.uk"
            "audiobookshelf.oliverdavies.uk"
            "bootstrap-with-tailwind.oliverdavies.uk"
            "code.oliverdavies.uk"
            "eric.oliverdavies.uk"
            "florida-drupalcamp-tailwind-css.oliverdavies.uk"
            "jellyfin.oliverdavies.uk"
            "luke.oliverdavies.uk"
            "nixedo.oliverdavies.uk"
            "paperless.oliverdavies.uk"
            "photos.oliverdavies.uk"
            "phpsw-sculpin-demo.oliverdavies.uk"
            "rebuilding-acquia.oliverdavies.uk"
            "rebuilding-bartik.oliverdavies.uk"
            "rebuilding-bristol-js.oliverdavies.uk"
            "rebuilding-symfony.oliverdavies.uk"
            "tailwindcss-demo.oliverdavies.uk"
            "talking-drupal-tailwindcss.oliverdavies.uk"
            "uptime.oliverdavies.uk"
            "wp-tailwind.oliverdavies.uk"
            "www.oliverdavies.uk"
            "zet.oliverdavies.uk"
          ];
        };
      };
    };
}
