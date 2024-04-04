{ config, pkgs, ... }:

{
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
}
