alias b := build
alias s := switch
alias t := test
alias u := update

_default:
    just --list

build *args:
    @just _nixos build {{ args }}

check:
    nix flake check

clean:
    nix store optimise --verbose
    nix store gc --verbose

collect-garbage:
    nix-collect-garbage -d
    sudo nix-collect-garbage -d

format:
    nix fmt flake.nix hosts modules

switch *args:
    @just _nixos switch {{ args }}

test *args:
    @just _nixos test {{ args }}

update:
    nix flake update

_nixos command *args:
    sudo nixos-rebuild {{ command }} --flake . {{ args }}
