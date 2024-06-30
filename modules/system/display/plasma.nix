{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.plasma;
in {
  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.plasma6 = {
        enable = true;
        enableQt5Integration = true;
      };
    };

    environment.plasma6.excludePackages = with pkgs; [
      kdePackages.discover
      kdePackages.elisa
      kdePackages.kate
      kdePackages.khelpcenter
      kdePackages.konsole
      kdePackages.kwalletmanager
      kdePackages.plasma-browser-integration
      kdePackages.plasma-systemmonitor
    ];
  };
}
