{ ports }:

let
  mkSite =
    name: overrides:
    let
      root = "/var/www/vhosts/${name}" + (overrides.rootSuffix or "");
      port = ports."nginx-${name}";
      url = "${name}.oliverdavies.uk";
    in
    { inherit port root url; } // overrides;

  sites =
    [
      {
        root = "/var/www/vhosts/website-sculpin";
        port = ports.nginx-website-2025;
        url = "2025.oliverdavies.uk";

        extraConfig = ''
          add_header X-Robots-Tag "noindex, nofollow";
        '';
      }

      (mkSite "eric" {
        rootSuffix = "/public";

        extraConfig = ''
          add_header X-Robots-Tag "noindex, nofollow";
        '';
      })
    ]
    ++ map
      (
        domain:
        mkSite domain {
          extraConfig = ''
            add_header X-Robots-Tag "noindex, nofollow";
          '';
        }
      )
      [
        "bootstrap-with-tailwind"
        "florida-drupalcamp-tailwind-css"
        "luke"
        "phpsw-sculpin-demo"
        "rebuilding-acquia"
        "rebuilding-bartik"
        "rebuilding-bristol-js"
        "rebuilding-symfony"
        "tailwindcss-demo"
        "talking-drupal-tailwindcss"
        "wp-tailwind"
        "zet"
      ];
in
sites
