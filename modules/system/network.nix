{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.network;
in {
  config = lib.mkIf cfg.enable {
    networking = {
      networkmanager = {
        enable = true;
      };

      firewall = {
        enable = true;
      };
    };

    services = {
      fail2ban = {
        enable = true;
        bantime = "4000";
      };
    };
  };
}
