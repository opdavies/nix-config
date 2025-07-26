{
  flake.modules.nixvim.custom = {
    plugins.oil = {
      enable = true;

      settings = {
        delete_to_trash = true;

        keymaps."-" = "actions.parent";

        skip_confirm_for_simple_edits = true;
        view_options.show_hidden = true;
      };
    };

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "-";
      }
    ];
  };
}
