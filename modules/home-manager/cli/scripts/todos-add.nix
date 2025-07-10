{ pkgs }:

pkgs.writeShellApplication {
  name = "todos-add";

  runtimeInputs = with pkgs; [ coreutils ];

  text = ''
    TODOS_PATH="$HOME/Documents/wiki/todo.txt"

    if [ ''${#} -eq 0 ]; then
      if [ -p "/dev/stdin" ]; then
        (cat; printf "\n\n") >> "''${TODOS_PATH}"
      else
        eval "''${TODOS_EDITOR}" "''${TODOS_PATH}"
      fi
    else
      printf "%s\n\n" "''${*}" >> "''${TODOS_PATH}"
    fi
  '';
}
