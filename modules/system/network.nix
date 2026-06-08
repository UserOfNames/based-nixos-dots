{ config, lib, ... }:

let
  cfg = config.myModules.system.network;
  userName = config.myModules.system.mainUser.userName;
in {
  config = lib.mkIf cfg.enable {
    networking = {
      networkmanager = {
        enable = true;
        
        wifi = {
          backend = "iwd";
        };
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

    users.users.${userName}.extraGroups = [ "networkmanager" ];
  };
}
