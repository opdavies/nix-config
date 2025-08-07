{
  flake.modules.nixvim.custom.plugins.cmp = {
    enable = true;

    autoEnableSources = true;

    settings = {
      mapping = {
        "<C-e>" = "cmp.mapping.close()";

        "<C-h>" = ''
          cmp.mapping(function()
            if ls.locally_jumpable(-1) then
              ls.jump(-1)
            end
          end)
        '';

        "<C-l>" = ''
          cmp.mapping(function()
            if ls.expand_or_locally_jumpable() then
              ls.expand_or_jump()
            end
          end)
        '';

        "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
        "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";

        "<C-y>" = "cmp.mapping.confirm({ select = true })";

        "<CR>" = "nil";
        "<S-Tab>" = "nil";
        "<Tab>" = "nil";
      };

      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      sources = [
        { name = "nvim_lsp"; }
        { name = "nvim_lua"; }
        {
          name = "luasnip";
          keyword_length = 2;
        }
        {
          name = "buffer";
          keyword_length = 3;
        }
      ];
    };
  };
}
