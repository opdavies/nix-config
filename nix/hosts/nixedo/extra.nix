{
  programs.dconf.enable = true;

  services.logind.lidSwitchExternalPower = "ignore";

  age.identityPaths = [
    "/home/opdavies/.ssh/id_rsa"
  ];
}
