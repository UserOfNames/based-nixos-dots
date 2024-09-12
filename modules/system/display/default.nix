{ config, lib, myLib, ... }:

let
  cfg = config.myModules.system;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myModules.system.display = {
    enable = mke "Enable basic display settings";
    hyprland.enable = mke "Enable basic hyprland (configuration is a home module)";
    plasma.enable = mke "Enable KDE plasma module";
    sddm.enable = mke "Enable SDDM module";
  };

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
