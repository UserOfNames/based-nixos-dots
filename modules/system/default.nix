{ config, pkgs, lib, ... }:

{
  imports = [
    ./bootloader.nix
    ./display.nix
    ./fonts.nix
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

  myModules.bootloader.enable = lib.mkDefault true;
  myModules.display.enable = lib.mkDefault true;
  myModules.fonts.enable = lib.mkDefault true;
  myModules.environment.enable = lib.mkDefault true;
  myModules.hardware.enable = lib.mkDefault true;
  myModules.locale.enable = lib.mkDefault true;
  myModules.network.enable = lib.mkDefault true;
  myModules.packages.enable = lib.mkDefault true;
  myModules.security.enable = lib.mkDefault true;
  myModules.store.enable = lib.mkDefault true;
  myModules.user.enable = lib.mkDefault true;
  myModules.zsh.enable = lib.mkDefault true;
}
