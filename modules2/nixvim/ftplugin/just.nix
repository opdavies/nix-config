{
  flake.modules.nixvim.custom = {
    extraFiles."after/ftplugin/just.lua".text =
      # lua
      ''
        local opt = vim.opt_local

        opt.shiftwidth = 4
      '';
  };
}
