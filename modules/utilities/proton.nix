{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.utilities.proton;
in {
  config = lib.mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      proton-vpn
    ];
  };
}
