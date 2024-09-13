{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "system" "display" ];

  cfg = config.myModules.system;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    programs.xwayland.enable = true;
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
        };
      };
    };

    myModules.system.display = {
      enable = lmd cfg.enable;
      # hyprland.enable = lmd cfg.display.enable;
      # plasma.enable = lmd cfg.display.enable;
      sddm.enable = lmd cfg.display.enable;
    };
  };
}
