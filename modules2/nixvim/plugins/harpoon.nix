let
  leaderBinding = key: command: {
    key = "<leader>${key}";
    action = "<cmd>${command}<CR>";
    options.silent = true;
  };
in
{
  flake.modules.nixvim.custom = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      {
        key = "<leader>a";
        action.__raw = "function() require'harpoon':list():add() end";
      }

      {
        key = "<C-e>";
        action.__raw = ''
          function()
            require 'harpoon'.ui:toggle_quick_menu(require'harpoon':list())
          end
        '';
      }
    ]
    ++ (map
      (num: leaderBinding "${toString num}" "lua require(\"harpoon\"):list():select(${toString num})")
      [
        1
        2
        3
        4
        5
        6
        7
        8
        9
      ]
    );
  };
}
