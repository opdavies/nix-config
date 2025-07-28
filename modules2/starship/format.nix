{ lib, ... }:

{
  # https://starship.rs/config/#prompt
  flake.modules.homeManager.base.programs.starship.settings.format = lib.concatStringsSep "" [
    "\n"
    "$username"
    "$hostname"
    "$directory"
    "$vcsh"
    "$git_branch"
    "$git_status"
    "$git_metrics"
    "$docker_context"
    "$nodejs"
    "$php"
    "$terraform"
    "$nix_shell"
    "$direnv"
    "\${custom.mob}"
    "$memory_usage"
    "$cmd_duration"
    "$lua"
    "$status"
    "$character"
  ];
}
