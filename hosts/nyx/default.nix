{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # (import ./disko.nix { device = "/dev/sda"; })
  ];


  # Set hostname 
  networking.hostName = "nyx";


  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];
  

  # Toggle modules
  module-steam.enable = true;

  module-user.enable = true;
  module-user.userName = "zdbg";


  # Leave this unchanged
  system.stateVersion = "23.11";
}
