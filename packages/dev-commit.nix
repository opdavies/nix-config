{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "dev-commit";

  runtimeInputs = with pkgs; [
    coreutils
    git
    logger
    openssh
  ];

  text = ''
    IFS=':' read -ra repos <<< "$DEV_COMMIT_PATHS"

    for repo in "''${repos[@]}"; do
      logger "Processing repository: $repo"

      pushd "$repo" > /dev/null 2>&1

      if [[ -n $(git status --porcelain) ]]; then
        logger "Changes detected in $repo"

        git status --short | while read -r line; do
          logger "Changed file: $line"
        done

        git add .

        if git commit -m "Automated dev commit"; then
          logger "Commit successful in $repo"

          if git push; then
            logger "Push successful in $repo"
          else
            logger "Push failed in $repo"
          fi
        else
          logger "No changes to commit in $repo"
        fi
      else
        logger "No changes in $repo"
      fi

      popd > /dev/null 2>&1
    done
  '';
}
