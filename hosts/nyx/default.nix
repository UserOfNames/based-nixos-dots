{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  # Set hostname 
  networking.hostName = "nyx";

  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];

  # Toggle modules
  module-steam.enable = true;

  # Leave this unchanged
  system.stateVersion = "22.11";
}
