{
  flake.modules.homeManager.base.programs.starship.settings.custom.mob = {
    command = "echo $MOB_TIMER_ROOM";
    format = "[($output)]($style) ";
    when = "[[ -v MOB_TIMER_ROOM ]]";
  };
}
