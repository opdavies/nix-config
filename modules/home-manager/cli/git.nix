{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.features.cli.git;
in
{
  options.features.cli.git = {
    enable = mkEnableOption "Enable git";

    user = mkOption {
      type = types.submodule {
        options = {
          emailAddress = mkOption {
            description = "User email address.";
            type = types.str;
            apply =
              x:
              assert builtins.match "^[^@]+@[^@]+\\.[^@]+$" x != null;
              x;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home.file."${config.xdg.configHome}/git/message".text = ''


      # Description
      #
      # - Why is this change necessary?
      # - How does it address the issue?
      # - What side effects does this change have?
      #
      # For breaking changes, uncomment the following line and describe the change:
      #
      # BREAKING CHANGE:
      #
      #
      # Add any issue IDs or commit SHAs that this commit references:
      #
      # Refs:

    '';

    programs = {
      git = {
        enable = true;
        userName = "Oliver Davies";
        userEmail = cfg.user.emailAddress;

        aliases = {
          aa = "add --all";
          assume = "update-index --assume-unchanged";
          assumed = "!git ls-files -v | grep '^[hsmrck?]' | cut -c 3-";
          b = "branch";
          blame = "blame -w -C -C -C";
          browse = "!gh repo view --web";
          ca = "commit --amend --verbose";
          car = "commit --amend --no-edit";
          cl = "!hub clone";
          co = "checkout";
          compare = "!hub compare";
          current-branch = "rev-parse --abbrev-ref HEAD";
          dc = "diff --color --word-diff --cached";
          df = "diff --color --word-diff";
          dup = "!git checkout develop && git fetch origin && echo && git sl develop..origin/develop && echo && git pull --quiet && git checkout -";
          fixup = "commit --fixup";
          issues = "!gh issue list --web";
          mup = "!git master-to-main-wrapper checkout %BRANCH% && git fetch origin && echo && git sl %BRANCH%..origin/%BRANCH% && echo && git pull --quiet && git checkout -";
          no-ff = "merge --no-ff";
          pl = "pull";
          prune = "remote prune origin";
          ps = "push";
          pulls = "!gh pr list --web";
          rbc = "rebase --continue";
          rdup = "!git dup && git rebase develop";
          remotes = "remote -v";
          repush = "!git pull --rebase && git push";
          ri = "rebase --interactive";
          rid = "!git rebase -i $(git merge-base develop HEAD)";
          rim = "!git rebase -i $(git master-to-main-wrapper merge-base %BRANCH% HEAD)";
          rip = "!git rebase -i $(git merge-base production HEAD)";
          ris = "!git rebase -i $(git merge-base staging HEAD)";
          riu = "!git rebase -i $(git rev-parse --abbrev-ref --symbolic-full-name @{u})";
          rmup = "!git mup && git master-to-main-wrapper rebase %BRANCH%";
          sl = "log --oneline --decorate -20";
          sla = "log --oneline --decorate --graph --all -20";
          slap = "log --oneline --decorate --graph --all";
          slp = "log --oneline --decorate";
          stash = "stash --included-untracked";
          unassume = "update-index --no-assume-unchanged";
          uncommit = "reset --soft HEAD^";
          unstage = "reset";
          update = "!git fetch --all --jobs=4 --prune --progress && git rebase --autostash --stat";
          upstream = "rev-parse --abbrev-ref --symbolic-full-name @{u}";
          ureset = "!git reset --hard $(git upstream)";
          worktrees = "worktree list";
        };

        ignores = [
          "/.ddev/providers/"
          "/.direnv/"
          "/.ignored/"
          "/.issue-id"
          "/.phpactor.json"
          "/notes"
          "/todo"
        ];

        extraConfig = {
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

    home = {
      packages = with pkgs; [
        git-extras
        git-trim
        stable.git-instafix
      ];

      sessionVariables = {
        GIT_INSTAFIX_UPSTREAM = "origin/main";
      };
    };
  };
}
