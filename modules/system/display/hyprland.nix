{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.hyprland;
in {
  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      useTextGreeter = true;

      settings = {
        default_session = {
          command = builtins.concatStringsSep " " [
            "${pkgs.tuigreet}/bin/tuigreet"
            "--time"
            "--battery"
            "--asterisks"
            "--remember"
            "--cmd start-hyprland"
          ];
        };
      };
    };

    services.stash-clipboard = lib.mkDefault {
      enable = true;

      serviceArguments = [
        "--persist"
      ];
    };

    programs = {
      ssh.askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
      waybar.enable = true;

      hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
}
