{
  flake.modules.nixvim.custom.diagnostic.settings = {
    signs = true;
    underline = false;
    update_in_insert = false;

    virtual_text = {
      enable = true;
      spacing = 2;
    };
  };
}
