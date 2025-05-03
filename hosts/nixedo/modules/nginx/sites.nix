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

  sites = [
    (mkSite "eric" {
      rootSuffix = "/public";

      extraConfig = ''
        add_header X-Robots-Tag "noindex, nofollow";
      '';
    })

    (mkSite "luke" {
      extraConfig = ''
        add_header X-Robots-Tag "noindex, nofollow";
      '';
    })
  ];
in
sites
