{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "system" "display" ];

  cfg = config.myModules.system.display;
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
      # hyprland.enable = lmd true;
      # plasma.enable = lmd true;
      sddm.enable = lmd true;
    };
  };
}
