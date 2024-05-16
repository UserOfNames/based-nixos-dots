{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = ""; })
  ];


  networking.hostName = "";


  environment.systemPackages = with pkgs; [
  ];


  # Toggle modules
  myModules.user.userName = "zdbg";
  # myModules.gaming.enable = true;
  # myModules.virtualization.enable = true;


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "";
}
