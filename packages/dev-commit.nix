{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "dev-commit";

  runtimeInputs = with pkgs; [
    coreutils
    git
    openssh
  ];

  text = ''
    IFS=':' read -ra repos <<< "$DEV_COMMIT_PATHS"

    for repo in "''${repos[@]}"; do
      echo "Processing $repo"
      pushd "$repo"

      git add .
      git commit -m "Automated dev commit" || true
      git push

      popd
    done
  '';
}
