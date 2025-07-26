{
  flake.modules.nixvim.custom.plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>dl" = "setqflist";
      };

      lspBuf = {
        "<leader>ca" = "code_action";
        "<leader>cr" = "rename";
        K = "hover";
        gD = "declaration";
        gT = "type_definition";
        gd = "definition";
        gr = "references";
      };
    };

    servers.phpactor.enable = true;
  };
}
