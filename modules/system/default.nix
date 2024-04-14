{ config, pkgs, ... }:

{
  imports = [
    ./bootloader.nix
    ./display.nix
    ./environment.nix
    ./hardware.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./store.nix
    ./user.nix
    ./zsh.nix
  ];
}
