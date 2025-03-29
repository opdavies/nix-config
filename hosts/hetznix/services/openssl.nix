{
  services.openssh = {
    enable = true;

    settings = {
      AllowUsers = [ "opdavies" ];
      PermitRootLogin = "no";
    };
  };
}
