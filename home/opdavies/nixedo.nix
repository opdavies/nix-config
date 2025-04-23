{
  imports = [ ../common ];

  homeManagerModules = {
    cli = {
      fzf.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };
  };
}
