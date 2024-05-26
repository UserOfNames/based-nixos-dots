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

  options = {
    myModules.system.enable = lib.mkEnableOption "Enable 'system' module group";
  };

  config = {
    myModules.system = lib.mkIf config.myModules.system.enable {
      display = {
        enable = dtrue;
        hyprland.enable = dtrue;
        # plasma.enable = dtrue;
        sddm.enable = dtrue;
      };
      hardware = {
        # laptops.enable = dtrue;
        printing.enable = dtrue;
        sound.enable = dtrue;
      };
      bootloader = {
        enable = dtrue;
        useLatestKernel = dtrue;
      };
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
  };
}
