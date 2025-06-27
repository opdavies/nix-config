{ config, ... }:

{
  imports = [ ../common ];

  cli = {
    bluetuith.enable = true;
    bookmarkthis.enable = true;
    direnv.enable = true;
    fzf.enable = true;

    git = {
      enable = true;

      user.emailAddress = "oliver@oliverdavies.uk";
    };

    node.enable = true;

    notes = {
      enable = true;

      directory = "${config.xdg.userDirs.documents}/wiki/notes";
    };

    ranger.enable = true;
    sxhkd.enable = true;
    starship.enable = true;
    tmux.enable = true;

    tmux-sessionizer = {
      enable = true;
      enableDmenuIntegration = true;

      directories =
        let
          inherit (config.xdg.userDirs) documents extraConfig;

          repos = extraConfig.XDG_REPOS_DIR;
        in
        [
          repos
          "${repos}/*"
          documents
        ];
    };

    todos.enable = true;
    zsh.enable = true;
  };

  coding = {
    neovim.enable = true;
    phpactor.enable = true;
  };

  desktop = {
    browsers = {
      chromium.enable = true;

      firefox = {
        enable = true;

        homepageUrl = "https://nixedo.oliverdavies.uk";
      };

      qutebrowser.enable = true;
    };

    flameshot.enable = true;
    gtk.enable = true;

    media = {
      handbrake.enable = true;
      makemkv.enable = true;
      mpv.enable = true;
    };

    # redshift.enable = true;
  };

  services.gammastep.enable = true;
  services.gammastep.provider = "geoclue2";

  programs = {
    dev-commit = {
      enable = true;

      repoPaths =
        let
          personal = "${config.xdg.userDirs.extraConfig.XDG_REPOS_DIR}/personal";
        in
        [
          "${personal}/email-filters"
          "${personal}/nix-config"
          "${personal}/oliverdavies.uk-tome"
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

  xdg.configFile."pam-gnupg".text = ''
    098EE055DAD2B9CB68154C6759DD38292D2273B6
    1E21B58D69FFEFAD077F152A50FEA938A3413F50
  '';
}
