{ pkgs }:

pkgs.writeShellApplication {
  name = "timer";

  runtimeInputs = with pkgs; [
    _timer
    coreutils
    systemdMinimal
  ];

  text = ''
    mins=$1
    message="''${2:-}"

    nohup _timer "$mins" "$message" &> /dev/null &

    echo "timer started for $mins min"
    echo "timer started for $mins min, message: '$message'" | systemd-cat -t timer
  '';
}
