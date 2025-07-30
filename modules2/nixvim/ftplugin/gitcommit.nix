{
  flake.modules.nixvim.custom.extraFiles."after/ftplugin/gitcommit.lua".text =
    # lua
    ''
      vim.opt_local.colorcolumn = "50,72"
      vim.opt_local.spell = true
      vim.opt_local.textwidth = 72
    '';
}
