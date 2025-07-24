{ config, ... }:

{
  flake.modules.homeManager.base = hmArgs: {
    programs.git = {
      userName = config.flake.meta.owner.name;
      userEmail = config.flake.meta.owner.email;

      extraConfig = {
        branch = {
          autosetupmerge = true;
          autosetuprebase = "always";
          sort = "-committerdate";
        };

        checkout.defaultRemote = "origin";
        color.ui = true;
        column.ui = "auto";
        commit.template = "${hmArgs.config.xdg.configHome}/git/message";

        core = {
          editor = "nvim";
          excludesFile = "~/.config/git/ignore";
        };

        diff.tool = "vimdiff";
        fetch.prune = true;
        gpg.format = "ssh";
        grep.lineNumber = true;
        help.autocorrect = "1";
        init.defaultBranch = "main";

        maintenance = {
          auto = false;
          strategy = "incremental";
        };

        merge.ff = "only";

        push = {
          autoSetupRemote = true;
          default = "upstream";
        };

        pull = {
          ff = "only";
          rebase = true;
        };

        rebase = {
          autosquash = true;
          autostash = true;
        };

        user.signingkey = "~/.ssh/id_rsa.pub";
      };
    };
  };
}
