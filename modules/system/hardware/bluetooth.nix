{ config, lib, ... }:

let
  cfg = config.myModules.system.hardware.bluetooth;
in {
  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
