{
  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      home = {
        path = "/home/opdavies";
        browseable = true;
        writable = true;
        "valid users" = [ "opdavies" ];
        "force group" = "media";
        "create mask" = "0660";
        "directory mask" = "0770";
      };

      media = {
        path = "/mnt/media";
        browseable = true;
        writable = true;
        "valid users" = [ "opdavies" ];
        "force group" = "media";
        "create mask" = "0660";
        "directory mask" = "0770";
      };
    };
  };
}
