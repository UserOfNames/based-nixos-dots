{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "system" "hardware" ];

  cfg = config.myModules.system;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myModules.system.hardware = {
      enable = lmd cfg.enable;
      # bluetooth.enable = lmd cfg.hardware.enable;
      # laptop.enable = lmd cfg.hardware.enable;
      printing.enable = lmd cfg.hardware.enable;
      sound.enable = lmd cfg.hardware.enable;
    };
  };
}
