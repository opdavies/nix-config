{
  home-manager.users.opdavies.home = {
    sessionPath = [ "$HOME/.local/bin" ];

    file.".local/bin" = {
      source = ./scripts;
      recursive = true;
    };
  };
}
