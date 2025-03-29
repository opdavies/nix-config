{
  config,
  inputs,
  lib,
  self,
  pkgs,
  ...
}:

{
  imports = [
    (import ./cli {
      inherit
        config
        inputs
        lib
        self
        pkgs
        ;
    })

    ./desktop
  ];
}
