{
  flake.modules.nixvim.custom = {
    plugins.undotree.enable = true;

    keymaps = [
      {
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>u";
      }
    ];
  };
}
