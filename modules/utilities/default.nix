{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myModules" "utilities" ];

  cfg = config.myModules.utilities;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      _7zz
      cpu-x
      gnupg
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
    ];

    myModules.utilities = {
      # thunar.enable = lmd cfg.enable;
      # virtualization.enable = lmd cfg.enable;
    };
  };
}
