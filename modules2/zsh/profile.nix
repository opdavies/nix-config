{
  flake.modules.homeManager.base.programs.zsh.profileExtra = ''
    if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
      exec startx &>/dev/null
    fi
  '';
}
