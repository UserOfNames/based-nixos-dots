# This is a template for setting up a new host. Make changes as needed.
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = ""; })
  ];


  # Set hostname 
  networking.hostName = "";


  # Extra packages for this system
  environment.systemPackages = with pkgs; [
  ];


  # Toggle modules
  # module-steam.enable = true;

  # module-main-user.enable = true;
  # module-main-user.userName = "";


  # Leave this unchanged
  system.stateVersion = "";
}
