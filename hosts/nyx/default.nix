{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common
    ../../modules
  ];

  # Set hostname 
  networking.hostName = "nyx";



  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];



  # Leave this unchanged
  system.stateVersion = "22.11";
}
