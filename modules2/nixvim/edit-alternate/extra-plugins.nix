{ inputs, ... }:

{
  flake.modules.nixvim.custom =
    { pkgs, ... }:
    {
      extraPlugins =
        let
          inherit (pkgs.vimUtils) buildVimPlugin;
        in
        [
          (buildVimPlugin {
            pname = "conf-vim";
            src = inputs.conf-vim;
            version = "unstable";
          })

          (buildVimPlugin {
            pname = "edit-alternate-vim";
            src = inputs.edit-alternate-vim;
            version = "unstable";
          })

          (buildVimPlugin {
            pname = "standard-vim";
            src = inputs.standard-vim;
            version = "unstable";
          })
        ];
    };
}
