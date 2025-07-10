{ pkgs, ... }:

{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
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
      ];
    };

    treesitter-textobjects.enable = true;
  };
}
