{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programs.dev-commit;
  repoPaths = concatStringsSep ":" cfg.repoPaths;
in
{
  options.programs.dev-commit = {
    enable = mkEnableOption "Enable dev-commit";

    repoPaths = mkOption {
      default = [ ];
      description = "A list of repository paths that should have automated commits";
      type = types.listOf types.path;
    };

    schedule = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Enable automated dev commits with systemd";

          time = mkOption {
            description = ''
              Time expression for when to run the dev-commit job.

              This uses systemd's `OnCalendar` syntax.

              Examples:
                - "hourly" (once every hour)
                - "daily" (once per day at midnight)
                - "Mon *-*-01 12:00:00" (every Monday at 12:00 PM)

              See `man systemd.time` for full syntax reference.
            '';
            default = "hourly";
            type = types.str;
          };
        };
      };

      default = {
        enable = false;
        time = "hourly";
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = [
        pkgs.dev-commit
      ];

      sessionVariables.DEV_COMMIT_PATHS = repoPaths;
    };

    systemd.user = mkIf cfg.schedule.enable {
      services.dev-commit = {
        Install.WantedBy = [ "default.target" ];

        Service = {
          Environment = [
            "DEV_COMMIT_PATHS=${repoPaths}"
          ];

          ExecStart = "${lib.getExe pkgs.dev-commit}";

          Type = "oneshot";
        };

        Unit.Description = "dev-commit";
      };

      timers.dev-commit = {
        Install.WantedBy = [ "timers.target" ];

        Timer = {
          OnCalendar = cfg.schedule.time;
          Unit = "dev-commit.service";
        };

        Unit.Description = "Runs automated development commits in select project repositories.";
      };
    };
  };
}
