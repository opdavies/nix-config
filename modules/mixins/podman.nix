{
  virtualisation = {
    oci-containers.backend = "podman";

    podman = {
      enable = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  users.users.opdavies.extraGroups = [ "podman" ];
}
