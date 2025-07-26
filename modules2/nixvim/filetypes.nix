{
  flake.modules.nixvim.custom.filetype = {
    extension = {
      "neon.dist" = "yaml";
      inc = "php";
      install = "php";
      module = "php";
      neon = "yaml";
      pcss = "scss";
      theme = "php";
    };

    filename = {
      "composer.lock" = "json";
    };
  };
}
