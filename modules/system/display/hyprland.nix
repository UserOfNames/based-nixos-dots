{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.hyprland;
in {
  config = lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        wl-clipboard
      ];

    services.displayManager = {
      # TODO: Do I want to use PLM or greetd for Hyprland?
      plasma-login-manager = lib.mkDefault {
        enable = true;
      };

      defaultSession = "hyprland";
    };

    services.stash-clipboard = {
      enable = lib.mkDefault true;
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
