{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./display
    ./hardware
    ./bootloader.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./store.nix
    ./user.nix
    ./zsh.nix
  ];

  config = lib.mkIf cfg.enable {
    myModules.system = {
      display = {
        enable = dtrue;
        hyprland.enable = dtrue;
        sddm.enable = dtrue;
      };
      hardware = {
        printing.enable = dtrue;
        sound.enable = dtrue;
      };
      bootloader = {
        enable = dtrue;
        useLatestKernel = dtrue;
      };
      fonts.enable = dtrue;
      locale.enable = dtrue;
      network.enable = dtrue;
      packages.enable = dtrue;
      security.enable = dtrue;
      store.enable = dtrue;
      user.enable = dtrue;
      zsh.enable = dtrue;
    };
  };
}
