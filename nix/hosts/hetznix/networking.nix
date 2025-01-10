{
  networking = {
    firewall.allowedTCPPorts = [
      80
      443
    ];

    interfaces.enp1s0 = {
      useDHCP = true;

      ipv4.addresses = [
        {
          address = "116.203.11.255";
          prefixLength = 32;
        }
      ];
    };
  };
}
