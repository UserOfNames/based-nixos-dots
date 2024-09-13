{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules" "other" ];

  cfg = config.myHomeModules.other;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      fastfetch.enable = lmd true;
      newsboat.enable = lmd true;
      stylix.enable = lmd true;
      ytdlp.enable = lmd true;
    };
  };
}
