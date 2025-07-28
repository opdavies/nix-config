{
  flake.modules.nixvim.custom.plugins = {
    cmp_luasnip.enable = true;

    luasnip = {
      enable = true;

      fromLua = [
        {
          lazyLoad = true;
          paths = ./snippets;
        }
      ];
    };
  };
}
