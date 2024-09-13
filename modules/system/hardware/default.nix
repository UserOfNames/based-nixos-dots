{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "system" "hardware" ];

  cfg = config.myModules.system.hardware;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myModules.system.hardware = {
      # bluetooth.enable = lmd true;
      # laptop.enable = lmd true;
      printing.enable = lmd true;
      sound.enable = lmd true;
    };
  };
}
