{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins = with pkgs.vimPlugins; [ phpactor ];

      keymaps = [
        {
          key = "<leader>pm";
          action = "<cmd>PhpactorContextMenu<CR>";
        }

        {
          key = "<leader>pn";
          action = "<cmd>PhpactorClassNew<CR>";
        }
      ];
    };
}
