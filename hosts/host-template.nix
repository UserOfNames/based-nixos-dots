# This is a template for setting up a new host. Make changes as needed.
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  # Set hostname 
  networking.hostName = "";


  # Extra packages for this system
  environment.systemPackages = with pkgs; [
  ];


  # Toggle modules
  # module-steam.enable = true;

  # module-user.enable = true;
  # module-user.userName = "";


  # Leave this unchanged
  system.stateVersion = "";
}
