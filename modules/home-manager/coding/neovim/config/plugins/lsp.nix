{
  plugins.lsp.enable = true;

  plugins.lsp.keymaps = {
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
}
