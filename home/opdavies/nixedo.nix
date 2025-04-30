{
  imports = [ ../common ];

  features = {
    cli = {
      fzf.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };
  };
}
