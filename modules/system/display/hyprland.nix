{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.hyprland;
in {
  config = lib.mkIf cfg.enable {
    services.displayManager = {
      # TODO: Do I want to use PLM or greetd for Hyprland?
      plasma-login-manager = lib.mkDefault {
        enable = true;
      };

      defaultSession = "hyprland";
    };

    services.blueman.enable = config.myModules.system.hardware.bluetooth.enable;

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
