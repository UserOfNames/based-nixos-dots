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


  myModules = {
    system = {
      enable = true;
      user.userName = "";
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
    };
  };


  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "";
}
