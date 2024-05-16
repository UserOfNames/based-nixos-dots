{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.network.enable = lib.mkEnableOption "Enable network module";
  };

  config = lib.mkIf config.myModules.system.network.enable {
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
