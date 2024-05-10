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
  # module-user.userName = "";

  # module-steam.enable = true;
  # module-virtualization.enable = true;


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "";
}
