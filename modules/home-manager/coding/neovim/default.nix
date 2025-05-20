{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.coding.neovim;
in
{
  options.coding.neovim.enable = mkEnableOption "Enable neovim";

  config = mkIf cfg.enable {
    programs.neovim =
      let
        php = pkgs.php82;
      in
      {
        enable = true;

        plugins = with pkgs.vimPlugins; [
          comment-nvim
          gitsigns-nvim
          harpoon2
          mini-nvim
          nvim-web-devicons
          oil-nvim
          phpactor
          refactoring-nvim
          undotree
          vim-nix

          # Testing
          vim-test
          vimux

          # Git
          vim-fugitive

          # Debugging
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text

          # Treesitter
          (pkgs.vimPlugins.nvim-treesitter.withPlugins (
            plugins: with plugins; [
              bash
              comment
              css
              csv
              dockerfile
              gitattributes
              gitignore
              go
              html
              javascript
              json
              kdl
              lua
              luadoc
              make
              markdown
              markdown_inline
              nix
              php
              phpdoc
              query
              rst
              scss
              sql
              terraform
              twig
              typescript
              vim
              vimdoc
              vue
              xml
              yaml
            ]
          ))
          nvim-treesitter-textobjects

          # LSP, linting and formatting
          conform-nvim
          lsp-status-nvim
          nvim-lint
          nvim-lspconfig

          # Completion
          cmp-buffer
          cmp-calc
          cmp-cmdline
          cmp-nvim-lsp
          cmp-path
          cmp-treesitter
          cmp_luasnip
          lspkind-nvim
          nvim-cmp

          # Snippets
          luasnip

          # Telescope
          plenary-nvim
          popup-nvim
          telescope-frecency-nvim
          telescope-fzf-native-nvim
          telescope-live-grep-args-nvim
          telescope-nvim
          telescope-ui-select-nvim

          # Databases
          vim-dadbod
          vim-dadbod-ui
          vim-dadbod-completion

          # Themes
          catppuccin-nvim
        ];

        extraPackages = with pkgs; [
          ripgrep
        ];
      };

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };

    home.file.".markdownlint.yaml".text = ''
      default: true

      line-length: false

      no-duplicate-heading:
        siblings_only: true
    '';
  };
}
