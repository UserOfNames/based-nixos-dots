{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/sda"; })
  ];


  # Set hostname 
  networking.hostName = "nyx";


  # Extra packages for this system
  environment.systemPackages = with pkgs; [
    tor-browser
  ];
  

  # Toggle modules
  myModules.user.userName = "zdbg";

  myModules.steam.enable = true;
  myModules.virtualization.enable = true;


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "23.11";
}
