{ config, options, ... }:

{
  imports = [ ../common ];

  cli = {
    direnv.enable = true;
    fzf.enable = true;

    git = {
      enable = true;

      user.emailAddress = "oliver.davies@tfw.wales";
    };

    node.enable = true;
    notes.enable = true;
    ranger.enable = true;
    starship.enable = true;
    tmux.enable = true;

    tmux-sessionizer = {
      enable = true;

      directories =
        let
          inherit (config.xdg.userDirs) documents extraConfig;

          repos = extraConfig.XDG_REPOS_DIR;
        in
        options.cli.tmux-sessionizer.directories.default
        ++ [
          repos
          "${repos}/*"
          documents
        ];
    };

    zsh.enable = true;
  };

  coding = {
    neovim.enable = true;
    phpactor.enable = true;
  };

  xdg.configFile."pam-gnupg".text = ''
    C0D940F9A390F286FCAAE8439D501171E39D0A47
  '';
}
