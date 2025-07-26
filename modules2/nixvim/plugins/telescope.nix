{
  flake.modules.nixvim.custom.plugins.telescope = {
    enable = true;

    extensions = {
      live-grep-args.enable = true;
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    keymaps = {
      "<leader>/" = "current_buffer_fuzzy_find";
      "<leader>fb" = "buffers";
      "<leader>fd" = "find_files";
      "<leader>fg" = "live_grep";

      "<leader>gw" = {
        action = "grep_string";
        mode = [
          "n"
          "v"
        ];
      };
    };

    settings.defaults.layout_config.prompt_position = "top";
    settings.defaults.sorting_strategy = "ascending";

    settings.pickers.find_files.hidden = true;
  };
}
