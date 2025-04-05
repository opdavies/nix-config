{
  home-manager.users.opdavies = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    home.sessionVariables = {
      FZF_DEFAULT_OPTS = "--reverse";
    };
  };
}
