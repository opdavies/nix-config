{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./t480/gammastep.nix
  ];

  features = {
    cli = {
      bluetuith.enable = true;
      bookmarkthis.enable = true;
      direnv.enable = true;
      fzf.enable = true;

      git.enable = true;
      git.user.emailAddress = "oliver@oliverdavies.uk";

      node.enable = true;

      notes.enable = true;
      notes.directory = "${config.xdg.userDirs.documents}/wiki/notes";

      ranger.enable = true;
      sxhkd.enable = true;
      starship.enable = true;
      tmux.enable = true;

      tmux-sessionizer.enable = true;
      tmux-sessionizer.searchPaths =
        let
          inherit (config.xdg) userDirs;
        in
        [
          "${userDirs.extraConfig.XDG_REPOS_DIR}:2"
          "${userDirs.documents}:1"
        ];

      zsh.enable = true;
    };

    coding = {
      neovim.enable = true;
      phpactor.enable = true;
    };

    desktop = {
      browsers = {
        chromium.enable = true;

        firefox.enable = true;
        firefox.homepageUrl = "https://nixedo.oliverdavies.uk";

        qutebrowser.enable = true;
      };

      flameshot.enable = true;
      gtk.enable = true;

      media = {
        handbrake.enable = true;
        makemkv.enable = true;
        mpv.enable = true;
      };
    };
  };

  programs = {
    dev-commit = {
      enable = false;

      repoPaths =
        let
          personal = "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/personal";
        in
        [
          "${personal}/email-filters"
          "${personal}/nix-config"
          "${personal}/oliverdavies.uk"
          "${personal}/opentofu-dns"
        ];

      schedule = {
        enable = true;
        time = "daily";
      };
    };

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
    displayselect
    qrencode
    mounter
    move-firefox-screenshots
    setbg
    tag-release
    timer
    todos-add
    unmounter
    update-all-git-repos
  ];

  xdg.configFile."pam-gnupg".text = ''
    098EE055DAD2B9CB68154C6759DD38292D2273B6
    1E21B58D69FFEFAD077F152A50FEA938A3413F50
  '';
}
