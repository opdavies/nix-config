{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.homeManagerModules.coding.neovim;
in
{
  options.homeManagerModules.coding.neovim.enable = mkEnableOption "Enable neovim";

  config = mkIf cfg.enable {
    programs.neovim =
      let
        php = pkgs.php82;
        phpPackages = pkgs.php82Packages;
      in
      {
        enable = true;

        plugins = with pkgs.vimPlugins; [
          comment-nvim
          conf-vim
          edit-alternate-vim
          gitsigns-nvim
          harpoon2
          mini-nvim
          nvim-web-devicons
          phpactor
          refactoring-nvim
          standard-vim
          undotree
          vim-caser
          vim-nix
          vim-pasta
          vim-repeat
          vim-sleuth
          vim-textobj-indent
          vim-textobj-user
          vim-textobj-xmlattr
          vim-unimpaired

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
          friendly-snippets
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
          # Languages
          nodePackages.typescript
          nodejs-slim
          php

          # Language servers
          bash-language-server
          dockerfile-language-server-nodejs
          emmet-language-server
          gopls
          lua-language-server
          lua54Packages.luacheck
          marksman
          nixd
          phpactor
          tailwindcss-language-server
          terraform-ls
          typescript-language-server
          vscode-langservers-extracted
          vue-language-server
          yaml-language-server

          # Formatters
          black
          eslint_d
          nixfmt-rfc-style
          nodePackages.prettier
          stylua
          yamlfmt

          # Tools
          hadolint
          html-tidy
          mariadb
          nodePackages.jsonlint
          nodePackages.markdownlint-cli
          phpPackages.php-codesniffer
          phpPackages.phpstan
          proselint
          ripgrep
          shellcheck
          yamllint
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
