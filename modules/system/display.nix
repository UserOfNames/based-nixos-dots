{ config, pkgs, ... }:

{
  # Wayland with xwayland, Plasma/SDDM
  programs.xwayland.enable = true;
  services = {
   desktopManager.plasma6.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };

    xserver = {
      enable = true;
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
