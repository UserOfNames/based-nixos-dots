{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules" "system" ];

  cfg = config.myHomeModules.system;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.system = {
      # hyprland.enable = lmd true;
      zsh.enable = lmd true;
    };
  };
}
