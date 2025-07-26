{ config, lib, ... }:

{
  flake.modules.nixvim.custom = {
    plugins.refactoring = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      {
        key = "<leader>ri";
        action = "<cmd>Refactor inline_var<CR>";
        mode = "n";
      }

      {
        key = "<leader>re";
        action = "<cmd>Refactor extract<CR>";
        mode = "x";
      }

      {
        key = "<leader>ri";
        action = "<cmd>Refactor inline_var<CR>";
        mode = "x";
      }

      {
        key = "<leader>rv";
        action = "<cmd>Refactor extract_var<CR>";
        mode = "x";
      }
    ];
    # ++
    #   lib.optionals
    #     (
    #       config.flake.modules.nixvim.custom.plugins.refactoring.enable
    #       && config.flake.modules.nixvim.custom.plugins.refactoring.enableTelescope
    #     )
    #     [
    #       {
    #         mode = "n";
    #         key = "<leader>rR";
    #         action.__raw = ''
    #           function()
    #             require('telescope').extensions.refactoring.refactors()
    #           end
    #         '';
    #         options.silent = true;
    #       }
    #     ];
  };
}
