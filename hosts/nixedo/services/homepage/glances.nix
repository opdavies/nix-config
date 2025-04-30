{ config }:

{
  Glances =
    let
      port = toString config.services.glances.port;
    in
    [
      {
        Info = {
          widget = {
            type = "glances";
            url = "http://localhost:${port}";
            metric = "info";
            chart = false;
            version = 4;
          };
        };
      }

      {
        "CPU Temp" = {
          widget = {
            type = "glances";
            url = "http://localhost:${port}";
            metric = "sensor:Package id 0";
            chart = false;
            version = 4;
          };
        };
      }

      {
        Processes = {
          widget = {
            type = "glances";
            url = "http://localhost:${port}";
            metric = "process";
            chart = false;
            version = 4;
          };
        };
      }

      {
        Network = {
          widget = {
            type = "glances";
            url = "http://localhost:${port}";
            metric = "network:enp0s13f0u1";
            chart = false;
            version = 4;
          };
        };
      }
    ];
}
