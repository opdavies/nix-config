{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./t480/gammastep.nix
  ];

  features = {
    cli = {
      zsh.enable = true;
    };
  };

  programs = {
    zsh.shellAliases =
      let
        inherit (config.xdg.userDirs) documents;
      in
      {
        "wiki-push" =
          "rsync -avzP ${documents}/wiki nixedo.oliverdavies.uk:${documents} --delete --delete-after";
      };
  };

  home.packages = with pkgs; [
    backup-websites
    build-glove80
    count-tags
    create-script
    displayselect
    get-tags
    qrencode
    mounter
    move-firefox-screenshots
    set-background
    tag-release
    time-until
    timer
    todos-add
    todos-edit
    unmounter
    update-all-git-repos
    vix
    zet-new
  ];

  xdg.configFile."pam-gnupg".text = ''
    098EE055DAD2B9CB68154C6759DD38292D2273B6
    1E21B58D69FFEFAD077F152A50FEA938A3413F50
  '';
}
