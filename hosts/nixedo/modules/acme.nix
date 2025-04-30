{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    certs =
      let
        domain = "oliverdavies.uk";
      in
      {
        ${domain} = {
          inherit domain;

          dnsProvider = "cloudflare";
          email = "oliver@oliverdavies.uk";
          environmentFile = config.age.secrets.cloudflare.path;
          webroot = null;

          extraDomainNames =
            let
              subdomains = [
                "2020"
                "audiobookshelf"
                "bootstrap-with-tailwind"
                "code"
                "eric"
                "florida-drupalcamp-tailwind-css"
                "jellyfin"
                "luke"
                "nixedo"
                "paperless"
                "photos"
                "phpsw-sculpin-demo"
                "rebuilding-acquia"
                "rebuilding-bartik"
                "rebuilding-bristol-js"
                "rebuilding-symfony"
                "tailwindcss-demo"
                "talking-drupal-tailwindcss"
                "tome"
                "tubearchivist"
                "uptime"
                "vaultwarden"
                "wp-tailwind"
                "www"
                "zet"
              ];

              domains = map (subdomain: "${subdomain}.${domain}") subdomains;
            in
            domains;
        };
      };
  };
}
