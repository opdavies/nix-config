{
  flake.modules.nixvim.custom.plugins.lualine = {
    enable = true;

    settings.options = {
      component_separators = "";
      icons_enabled = false;
      section_separators = "";
    };
  };
}
