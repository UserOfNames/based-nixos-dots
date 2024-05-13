{ config, pkgs, lib, ... }:

{
  options = {
    myModules.network.enable = lib.mkEnableOption "Enable network module";
  };

  config = lib.mkIf config.myModules.network.enable {
    # Enable firewall with default policies, use network manager
    networking = {
      firewall = {
        enable = true;
      };

      networkmanager = {
        enable = true;
      };
    };

    # Enable fail2ban
    services = {
      fail2ban = {
        enable = true;
        bantime = "4000";
      };
    };
  };
}
