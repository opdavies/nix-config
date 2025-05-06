{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixedo.${name};
  name = "email-filters";
in
{
  options.nixedo.${name} = {
    configFile = lib.mkOption {
      default = "${config.home.homeDirectory}/Code/${name}/config.lua";
      internal = true;
    };
  };

  config = {
    systemd.user = {
      services.${name} = {
        Install.WantedBy = [ "default.target" ];

        Service = {
          ExecStart = "${lib.getExe pkgs.imapfilter} -c ${cfg.configFile}";
          Type = "oneshot";
        };

        Unit.Description = name;
      };

      timers.${name} = {
        Install.WantedBy = [ "timers.target" ];

        Timer = {
          OnCalendar = "*-*-* 06..23:00/5";
          Unit = "${name}.service";
        };

        Unit.Description = "Automatically runs email filters with imapfilter.";
      };
    };
  };
}
