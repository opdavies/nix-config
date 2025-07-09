{ outputs, ... }:

{
  imports = [
    outputs.homeManagerModules.default
  ];
}
