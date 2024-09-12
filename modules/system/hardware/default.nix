{ config, lib, myLib, ... }:

let
  cfg = config.myModules.system;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myModules.system.hardware = {
    enable = mke "Enable hardware module";
    bluetooth.enable = mke "Enable bluetooth";
    laptop.enable = mke "Enable some settings for laptops";
    printing.enable = mke "Enable printing";
    sound.enable = mke "Enable sound";
  };

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
