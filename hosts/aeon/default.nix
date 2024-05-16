{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/sda"; })
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t520
  ];


  networking.hostName = "aeon";


  environment.systemPackages = with pkgs; [
    tor-browser
  ];


  myModules = {
    system = {
      enable = true;
      user.userName = "zdbg";
      hardware = {
        laptops.enable = true;
        printing.enable = true;
      };
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
      virtualization.enable = true;
    };
  };


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "23.11";
}
