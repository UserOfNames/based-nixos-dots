{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myModules.system.display.plasma;
  userName = config.myModules.system.user.userName;
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

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
      kdePackages.gwenview
      kdePackages.kate
      kdePackages.khelpcenter
      kdePackages.konsole
      kdePackages.kwalletmanager
      kdePackages.okular
      kdePackages.plasma-browser-integration
      kdePackages.plasma-systemmonitor
    ];

    home-manager.users."${userName}".xdg.mimeApps.enable = false;
  };
}
