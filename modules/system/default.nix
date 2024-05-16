{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./display
    ./hardware
    ./bootloader.nix
    ./fonts.nix
    ./environment.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./store.nix
    ./user.nix
    ./zsh.nix
  ];

  myModules = {
    display = {
      enable = dtrue;
      hyprland.enable = dtrue;
    };
    hardware = {
      printing.enable = dtrue;
      sound.enable = dtrue;
    };
    bootloader.enable = dtrue;
    fonts.enable = dtrue;
    environment.enable = dtrue;
    locale.enable = dtrue;
    network.enable = dtrue;
    packages.enable = dtrue;
    security.enable = dtrue;
    store.enable = dtrue;
    user.enable = dtrue;
    zsh.enable = dtrue;
  };
}
