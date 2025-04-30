{ config, lib }:

with lib;

let
  homelab = config.features.homelab.services;

  homepageCategories = [
    "Media"
    "Services"
  ];

  homepageServices =
    category:
    (attrsets.filterAttrs (
      name: value: value ? homepage && value.homepage.category == category
    ) homelab);

  services = lists.forEach homepageCategories (cat: {
    "${cat}" =
      lib.lists.forEach (lib.attrsets.mapAttrsToList (name: value: name) (homepageServices "${cat}"))
        (x: {
          "${homelab.${x}.homepage.name}" = {
            icon = homelab.${x}.homepage.icon;
            description = homelab.${x}.homepage.description;
            href = "https://${homelab.${x}.url}";
            siteMonitor = "https://${homelab.${x}.url}";
          };
        });
  });
in
services
