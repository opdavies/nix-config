let
  baseDomain = "oliverdavies.uk";

  ports = import ./ports.nix;

  mkSite =
    name: overrides:
    let
      root = "/var/www/vhosts/${name}" + (overrides.rootSuffix or "");
    in
    {
      inherit root;

      port = ports.${name};
      url = "${name}.${baseDomain}";
    }
    // overrides;

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
