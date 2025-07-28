{ lib, ... }:

{
  flake.modules.homeManager.base =
    { config, pkgs, ... }:
    {
      options.programs.dev-commit = {
        repoPaths = lib.mkOption {
          default = [ ];
          description = "A list of repository paths that should have automated commits";
          type = lib.types.listOf lib.types.path;
        };

        schedule = lib.mkOption {
          type = lib.types.submodule {
            options = {
              enable = lib.mkEnableOption "Enable automated dev commits with systemd";

              time = lib.mkOption {
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
                type = lib.types.str;
              };
            };
          };

          default = {
            enable = false;
            time = "hourly";
          };
        };
      };

      config =
        let
          cfg = config.programs.dev-commit;
          repoPaths = lib.concatStringsSep ":" cfg.repoPaths;
        in
        {
          home = {
            packages = [ pkgs.dev-commit ];

            sessionVariables.DEV_COMMIT_PATHS = repoPaths;
          };

          systemd.user = lib.mkIf cfg.schedule.enable {
            services.dev-commit = {
              Install.WantedBy = [ "default.target" ];

              Service = {
                Environment = [ "DEV_COMMIT_PATHS=${repoPaths}" ];
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
    };
}
