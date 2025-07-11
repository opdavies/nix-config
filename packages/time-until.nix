{ pkgs }:

pkgs.writeShellApplication {
  name = "time-until";

  runtimeInputs = with pkgs; [ bc ];

  text = ''
    # Based on https://github.com/sdaschner/dotfiles/blob/master/bin/time-until.
    set +o nounset

    if [[ "$1" == "" ]]; then
      echo "Usage: ''${0##*/} <date-string>"
      echo " Example: ''${0##*/} 'tomorrow 06:00'"
      exit 2
    fi

    set -o nounset

    secsUntil=$(( $(date +%s -d "$*") - $( date +%s ) ))
    minutesUntil=$(bc <<< "scale=1; $secsUntil/60")
    hoursUntil=$(bc <<< "scale=2; $secsUntil/3600")
    date=$(date -d "$*")

    echo "$hoursUntil hours (or $minutesUntil mins) until $date"
  '';
}
