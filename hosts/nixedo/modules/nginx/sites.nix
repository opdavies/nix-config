[
  {
    url = "bootstrap-with-tailwind.oliverdavies.uk";
    root = "/var/www/vhosts/bootstrap-with-tailwind";
    port = 8081;
  }

  {
    port = 8084;
    root = "/var/www/vhosts/eric/public";
    url = "eric.oliverdavies.uk";

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  }

  {
    port = 8083;
    root = "/var/www/vhosts/florida-drupalcamp-tailwind-css";
    url = "florida-drupalcamp-tailwind-css.oliverdavies.uk";
  }

  {
    port = 8094;
    root = "/var/www/vhosts/luke";
    url = "luke.oliverdavies.uk";

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  }

  {
    port = 8085;
    root = "/var/www/vhosts/phpsw-sculpin-demo";
    url = "phpsw-sculpin-demo.oliverdavies.uk";
  }

  {
    port = 8086;
    root = "/var/www/vhosts/rebuilding-acquia";
    url = "rebuilding-acquia.oliverdavies.uk";
  }

  {
    port = 8087;
    root = "/var/www/vhosts/rebuilding-bartik";
    url = "rebuilding-bartik.oliverdavies.uk";
  }

  {
    port = 8088;
    root = "/var/www/vhosts/rebuilding-bristol-js";
    url = "rebuilding-bristol-js.oliverdavies.uk";
  }

  {
    port = 8089;
    root = "/var/www/vhosts/rebuilding-symfony";
    url = "rebuilding-symfony.oliverdavies.uk";
  }

  {
    port = 8090;
    root = "/var/www/vhosts/tailwindcss-demo";
    url = "tailwindcss-demo.oliverdavies.uk";
  }

  {
    port = 8091;
    root = "/var/www/vhosts/wp-tailwind";
    url = "wp-tailwind.oliverdavies.uk";
  }

  {
    port = 8092;
    root = "/var/www/vhosts/zet";
    url = "zet.oliverdavies.uk";
  }

  {
    port = 8093;
    root = "/var/www/vhosts/talking-drupal-tailwindcss";
    url = "talking-drupal-tailwindcss.oliverdavies.uk";
  }
]
