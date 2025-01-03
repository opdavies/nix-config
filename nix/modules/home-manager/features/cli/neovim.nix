{
  config,
  lib,
  pkgs,
  self,
  ...
}:

with lib;

{
  options.features.cli.neovim.enable = mkEnableOption "Enable neovim";

  config = mkIf config.features.cli.neovim.enable {
    programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        comment-nvim
        conf-vim
        edit-alternate-vim
        gitsigns-nvim
        harpoon
        mini-nvim
        nvim-web-devicons
        oil-nvim
        phpactor
        refactoring-nvim
        standard-vim
        undotree
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
        php81

        # Language servers
        gopls
        lua-language-server
        lua54Packages.luacheck
        marksman
        nixd
        nodePackages."@tailwindcss/language-server"
        nodePackages.bash-language-server
        nodePackages.dockerfile-language-server-nodejs
        nodePackages.intelephense
        nodePackages.typescript-language-server
        nodePackages.vscode-langservers-extracted
        nodePackages.yaml-language-server
        phpactor
        terraform-ls
        vue-language-server

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
        nodePackages.jsonlint
        nodePackages.markdownlint-cli
        php82Packages.php-codesniffer
        php82Packages.phpstan
        proselint
        shellcheck
        yamllint
      ];
    };

    xdg.configFile.nvim = {
      source = "${self}/nvim";
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
