{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.git.extraConfig = {
        branch = {
          autosetupmerge = true;
          autosetuprebase = "always";
          sort = "-committerdate";
        };

        checkout.defaultRemote = "origin";
        color.ui = true;
        column.ui = "auto";
        commit.template = "${config.xdg.configHome}/git/message";

        core = {
          editor = "nvim";
          excludesFile = "${config.xdg.configHome}/git/ignore";
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
}
