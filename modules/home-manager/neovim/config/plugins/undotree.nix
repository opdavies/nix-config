{ config, lib, ... }:

{
  plugins.undotree.enable = true;

  keymaps = lib.mkIf config.plugins.undotree.enable [
    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<leader>u";
    }
  ];
}
