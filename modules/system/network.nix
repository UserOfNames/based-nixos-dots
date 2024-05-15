{ config, pkgs, lib, ... }:

{
  options = {
    myModules.network.enable = lib.mkEnableOption "Enable network module";
  };

  config = lib.mkIf config.myModules.network.enable {
    networking = {
      firewall = {
        enable = true;
      };

      networkmanager = {
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
