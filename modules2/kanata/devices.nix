{ lib, ... }:

{
  flake.modules.nixos.pc =
    { config, ... }:
    {
      options.services.kanata.devices = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.str;
      };

      config.services.kanata.keyboards.default.devices = config.services.kanata.devices;
    };
}
