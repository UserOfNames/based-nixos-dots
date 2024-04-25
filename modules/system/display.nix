{ config, pkgs, inputs, ... }:

{
  # Wayland with xwayland, Plasma/SDDM
  programs.xwayland.enable = true;
  services = {
   # desktopManager.plasma6.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
    };
  };
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    waybar.enable = true;
  };
}
