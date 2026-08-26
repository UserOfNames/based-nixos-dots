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
    };

    # HACK: Because `services.stash-clipboard.arguments` passes to `stash`
    # instead of `stash watch`, we have to manually override like this
    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/misc/stash-clipboard.nix
    # TODO: open a PR or issue for this
    systemd.user.services.stash-clipboard.serviceConfig.ExecStart = 
      lib.mkForce "${lib.getExe config.services.stash-clipboard.package} watch --persist";

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
