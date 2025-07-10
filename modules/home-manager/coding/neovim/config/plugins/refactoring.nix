{ config, lib, ... }:

{
  plugins.refactoring = {
    enable = true;
    enableTelescope = true;
  };

  keymaps = lib.mkIf config.plugins.refactoring.enable (
    [
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
    ]
    ++ lib.optionals (config.plugins.refactoring.enable && config.plugins.refactoring.enableTelescope) [
      {
        mode = "n";
        key = "<leader>rR";
        action.__raw = ''
          function()
            require('telescope').extensions.refactoring.refactors()
          end
        '';
        options.silent = true;
      }
    ]
  );
}
