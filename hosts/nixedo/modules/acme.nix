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

        extraDomainNames =
          let
            baseDomain = "oliverdavies.uk";
          in
          [
            "2020.${baseDomain}"
            "audiobookshelf.${baseDomain}"
            "bootstrap-with-tailwind.${baseDomain}"
            "code.${baseDomain}"
            "eric.${baseDomain}"
            "florida-drupalcamp-tailwind-css.${baseDomain}"
            "jellyfin.${baseDomain}"
            "luke.${baseDomain}"
            "nixedo.${baseDomain}"
            "paperless.${baseDomain}"
            "photos.${baseDomain}"
            "phpsw-sculpin-demo.${baseDomain}"
            "rebuilding-acquia.${baseDomain}"
            "rebuilding-bartik.${baseDomain}"
            "rebuilding-bristol-js.${baseDomain}"
            "rebuilding-symfony.${baseDomain}"
            "tailwindcss-demo.${baseDomain}"
            "talking-drupal-tailwindcss.${baseDomain}"
            "tome.${baseDomain}"
            "uptime.${baseDomain}"
            "vaultwarden.${baseDomain}"
            "wp-tailwind.${baseDomain}"
            "www.${baseDomain}"
            "zet.${baseDomain}"
          ];
      };
    };
  };
}
