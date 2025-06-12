{ pkgs, ... }:

{
  # TODO: re-add DAP.
  # TODO: re-add snippets.
  # TODO: re-configure spell.

  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/fidget.nix
    ./plugins/fugitive.nix
    ./plugins/gitsigns.nix
    ./plugins/harpoon.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/luasnip.nix
    ./plugins/mini.nix
    ./plugins/nvim-autopairs.nix
    ./plugins/oil.nix
    ./plugins/phpactor.nix
    ./plugins/refactoring.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/undotree.nix
    ./plugins/vim-dadbod.nix
    ./plugins/vim-highlightedyank.nix
    ./plugins/vim-test.nix
    ./plugins/web-devicons.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";
  };

  extraPackages = with pkgs; [
    nixfmt-rfc-style
    stylua
  ];

  filetype = {
    extension = {
      "neon.dist" = "yaml";
      inc = "php";
      install = "php";
      module = "php";
      neon = "yaml";
      pcss = "scss";
      theme = "php";
    };

    filename = {
      "composer.lock" = "json";
    };
  };

  globals.mapleader = " ";
}
