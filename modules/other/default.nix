{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "other" ];

  cfg = config.myModules.other;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myModules.other = {
      gaming.enable = lmd cfg.enable;
      stylix.enable = lmd cfg.enable;
    };
  };
}
