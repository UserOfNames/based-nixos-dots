{ config, pkgs, ... }:

{
  # Wayland with xwayland, Plasma/SDDM, xkb uses US layout with caps lock mapped to escape
  programs.xwayland.enable = true;
  services = {
    desktopManager.plasma6.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma";
      };

      xkb = {
        layout = "us";
      };
    };
  };
  # Exclude these default plasma packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    khelpcenter
    plasma-browser-integration
    kwalletmanager
    plasma-systemmonitor
    kate
  ];
}
