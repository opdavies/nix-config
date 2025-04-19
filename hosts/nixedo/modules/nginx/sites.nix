[
  {
    url = "bootstrap-with-tailwind.oliverdavies.uk";
    root = "/var/www/bootstrap-with-tailwind";
    port = 8081;
  }

  {
    port = 8084;
    root = "/var/www/eric/public";
    url = "eric.oliverdavies.uk";

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  }

  {
    port = 8083;
    root = "/var/www/florida-drupalcamp-tailwind-css";
    url = "florida-drupalcamp-tailwind-css.oliverdavies.uk";
  }

  {
    port = 8094;
    root = "/var/www/luke";
    url = "luke.oliverdavies.uk";

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  }

  {
    port = 8085;
    root = "/var/www/phpsw-sculpin-demo";
    url = "phpsw-sculpin-demo.oliverdavies.uk";
  }

  {
    port = 8086;
    root = "/var/www/rebuilding-acquia";
    url = "rebuilding-acquia.oliverdavies.uk";
  }

  {
    port = 8087;
    root = "/var/www/rebuilding-bartik";
    url = "rebuilding-bartik.oliverdavies.uk";
  }

  {
    port = 8088;
    root = "/var/www/rebuilding-bristol-js";
    url = "rebuilding-bristol-js.oliverdavies.uk";
  }

  {
    port = 8089;
    root = "/var/www/rebuilding-symfony";
    url = "rebuilding-symfony.oliverdavies.uk";
  }

  {
    port = 8090;
    root = "/var/www/tailwindcss-demo";
    url = "tailwindcss-demo.oliverdavies.uk";
  }

  {
    port = 8091;
    root = "/var/www/wp-tailwind";
    url = "wp-tailwind.oliverdavies.uk";
  }

  {
    port = 8092;
    root = "/var/www/zet";
    url = "zet.oliverdavies.uk";
  }

  {
    port = 8093;
    root = "/var/www/talking-drupal-tailwindcss";
    url = "talking-drupal-tailwindcss.oliverdavies.uk";
  }
]
