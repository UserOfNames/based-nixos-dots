{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/sda"; })
  ];


  # Set hostname 
  networking.hostName = "aeon";


  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser
  ];


  # Toggle modules
  module-steam.enable = true;

  module-main-user.enable = true;
  module-main-user.userName = "zdbg";


  # Leave this unchanged
  system.stateVersion = "23.11";
}
