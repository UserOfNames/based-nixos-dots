{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.display.plasma.enable = lib.mkEnableOption "Enable plasma module";
  };

  config = lib.mkIf config.myModules.system.display.plasma.enable {
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
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
