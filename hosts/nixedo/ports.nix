{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.homelab.ports = mkOption {
    internal = true;
    type = types.attrsOf types.port;
  };

  config.homelab.ports = {
    homepage-dashboard = 8097;
    mealie = 9001;
    pihole = 8082;
    tubearchivist = 8099;
    vaultwarden = 8022;

    nginx-website-sculpin = 8095;
    nginx-website-tome = 8098;

    nginx-bootstrap-with-tailwind = 8081;
    nginx-eric = 8084;
    nginx-florida-drupalcamp-tailwind-css = 8083;
    nginx-luke = 8094;
    nginx-phpsw-sculpin-demo = 8085;
    nginx-rebuilding-acquia = 8086;
    nginx-rebuilding-bartik = 8087;
    nginx-rebuilding-bristol-js = 8088;
    nginx-rebuilding-symfony = 8089;
    nginx-tailwindcss-demo = 8090;
    nginx-talking-drupal-tailwindcss = 8093;
    nginx-wp-tailwind = 8091;
    nginx-zet = 8092;
  };
}
