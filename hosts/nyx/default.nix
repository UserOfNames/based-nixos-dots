{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common
  ];

  # Set hostname 
  networking.hostName = "nyx";



  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];

  

  # Enable modules
  modSteam.enable = true;



  # Leave this unchanged
  system.stateVersion = "22.11";
}
