{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules" "other" ];

  cfg = config.myHomeModules.other;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      fastfetch.enable = lmd cfg.enable;
      newsboat.enable = lmd cfg.enable;
      stylix.enable = lmd cfg.enable;
      ytdlp.enable = lmd cfg.enable;
    };
  };
}
