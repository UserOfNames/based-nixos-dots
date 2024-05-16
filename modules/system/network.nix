{ config, pkgs, lib, ... }:

{
  options = {
    myModules.network.enable = lib.mkEnableOption "Enable network module";
  };

  config = lib.mkIf config.myModules.network.enable {
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
