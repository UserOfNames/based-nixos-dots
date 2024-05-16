{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/sda"; })
  ];


  networking.hostName = "nyx";


  environment.systemPackages = with pkgs; [
    tor-browser
  ];
  

  # Toggle modules
  myModules.user.userName = "zdbg";

  myModules.gaming.enable = true;
  myModules.virtualization.enable = true;


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "23.11";
}
