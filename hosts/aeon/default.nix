{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules.nix
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/sda"; })
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t520
  ];

  networking.hostName = "aeon";

  environment.systemPackages = with pkgs; [
    tor-browser
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "23.11";
}
