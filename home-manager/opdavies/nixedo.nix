{
  imports = [
    ../common

    ./nixedo/email-filters.nix
  ];

  cli = {
    fzf.enable = true;
    starship.enable = true;
    zsh.enable = true;
  };
}
