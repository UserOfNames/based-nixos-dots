{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.hardware.bluetooth.enable = lib.mkEnableOption "Enable options for bluetooth";
  };

  config = lib.mkIf config.myModules.system.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };
}
