{
  imports = [
    ../common

    ./nixedo/email-filters.nix
  ];

  features.cli = {
    fzf.enable = true;
    starship.enable = true;
    zsh.enable = true;
  };
}
