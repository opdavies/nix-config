{ config, lib, ... }:

{
  plugins.oil = {
    enable = true;

    settings = {
      delete_to_trash = true;

      keymaps."-" = "actions.parent";

      skip_confirm_for_simple_edits = true;
      view_options.show_hidden = true;
    };
  };

  keymaps = lib.mkIf config.plugins.oil.enable [
    {
      action = "<cmd>Oil<CR>";
      key = "-";
    }
  ];
}
