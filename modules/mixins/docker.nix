{
  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  users.users.opdavies.extraGroups = [ "docker" ];
}
