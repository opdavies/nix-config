{ inputs, ... }:

{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins = with pkgs.vimPlugins; [
        vim-textobj-user

        (pkgs.vimUtils.buildVimPlugin {
          src = inputs.vim-textobj-xmlattr;
          pname = "vim-textobj-xmlattr";
          version = "unstable";
        })
      ];
    };
}
