{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  users.users.opdavies = {
    description = "Oliver Davies";
    initialPassword = "opdavies";
    isNormalUser = true;

    extraGroups = [
      "networkmanager"
      "wheel"
    ]
    ++ optional config.features.cli.podman.enable "podman";

    packages = with pkgs; [
      magic-wormhole
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcR57U61CmPbV/QlaqeBZh3SNmWPGC7rhJpt1Ds3d3N"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+V3VXq61adoK5kl7AqFsfoU0W0P0gMMc+2zIAvwoDhjqz/eUR823cAifIodJTmf4S4HolZ+Ww3iF8Z8stoBdQh59X11RcpvbBo3XdfkZmr5c7OBWerkJ9w4O0dJJkwm1eFLYuFfkyl5qedTaSs4qI74DmKHSQKOR3AlvOXzq31xMnwrPD8W5B8qsDQ4W6aIl+oXqVIHpWzfWmLHJosQc+z70nk+qWoF6pyYMpUwSfV4Cu9EEdQiwYtVoy/acp7FHn0+VTAlLJxm+ep2fRIiFNKpy5gVSanffTPBzQJjEHp4NCIG8+wqPae3QDiPe+sZS+26XcbOosYLr/J1IGwM68RHRpVcPIHezyiz+7SRKhUBvOO1xphoOprwp7EKxKROOMd6CvWYQE7m1f7gyPFFmSbjSNNE74gYY72FFx4FfPX0J0Ltebwr6xZ+pW3nw/GOaHx0W3D05CCO/nMYOqyrxO9RT88v6gAZFH4HEqS9lu6dssMZOWENFZCl3hVHQJbuLXbYoTaaVOZ99xfC/uslygzxaQf55TpwZSYjMOgXmOAKxV+0o1ZRH1YXbEHaLIzjhyQ58yFgCoLrMRxA6b8wIH6AYYyaLV7xQ1XBJ+MQYST9gXILItVJcfo1qrTAe3JxfODU0W5rYUlBHeBNIJWcHCxOKRFvUM2KkF79ULPG3rOw=="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkkbYaCD9NUIQT0NnsmlyfepwjxBYeiJSBCotOpdPTyc5inFAd29DiVw98j4skfaHdzjcqWmMFmDQWM6tGkK7eg8n0WuaABmsjdEbzTtfjHwM0tRDCIh5AtoT4IvoLhwLjEI2jKM05BGCQ2m5lS//AYJK1DjiV4UH+IjXHz6oy/3eFzQwANjxWS+mbR565p21yuAu1DKEyaGeVzT1xDhgzlnZG7Cys/rFgUYpIvYDHMOFxG6hsDB8vqyHiTXniniti5tdvGGYHgRGQcynRTU12aerrqHTIOefrElXJdf3/PA8FIY/Pd3MmZocY/vvQe0EVHXWrNtnHOF3MFQ1tFyfubKO51Dcp9KmzHnyBvO4CtvGVr/upSVWfo0I/EqkIqvCvBbdSIPeH9V5hAcyWENGF4Wf0/Yqtc0dBhfXJmPVBsC2ghZp9oERK+h5Xs7DpzkT0vtkN+wjgA5weIuG8e2UVNO29LWASzlychVqb7BVa6kNn5CyGwauyIGsYvAFnUjkyJpK8qleNM3VO5x9aw26IhSKlnSE9PAdX8p7PpdoWfxWRekKTc4h6iAe7pFOENvuokAvCNsE5LolR4VrYKXjA0m3nupDNWYexAWfR3lSeSlKd9nD3OENS0biJKayZHs11iDUTxm5u5gm/U60b4z0zDXjh1H/DI/pSCG6jjaXDpw=="
    ];
  };

  age.identityPaths = [
    "/home/opdavies/.ssh/id_rsa"
  ];
}
