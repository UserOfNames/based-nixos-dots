{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.hyprland;
in {
  config = lib.mkIf cfg.enable {
    services.displayManager.defaultSession = "hyprland";

    programs = {
      ssh.askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
      waybar.enable = true;
      hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
}
