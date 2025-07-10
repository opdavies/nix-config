{ pkgs }:

pkgs.writeShellApplication {
  name = "update-all-git-repos";

  runtimeInputs = with pkgs; [
    findutils
    git
  ];

  text = ''
    # Update all top-level Git repository clones within my Code directories to their
    # latest version.

    dirs=$(find "$XDG_REPOS_DIR" -mindepth 2 -maxdepth 3 -type d -name .git -not -path '*/*.old/*')

    for dir in $dirs; do
      repo_path="''${dir%/.git}"

      cd "''${repo_path}"

      # If the repo is a bare clone, the commands need to be run within the
      # worktree directory.
      [[ -f .bare/worktrees/main/gitdir && -d main && -f main/.git ]] && cd main

      echo "Updating $(pwd)"

      # Update the repository.
      git fetch --all --jobs=4 --progress --prune
      git pull --rebase
    done
  '';
}
