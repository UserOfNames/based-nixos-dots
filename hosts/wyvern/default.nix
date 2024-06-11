{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "wyvern";

  environment.systemPackages = with pkgs; [
    tor-browser
  ];

  myModules = {
    system = {
      enable = true;
      user.userName = "zdbg";
      hardware = {
        bluetooth.enable = true;
        laptops.enable = true;
      };
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
      thunar.enable = true;
    };
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "24.05";
}
