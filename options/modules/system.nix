{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myModules.system;
in {
  options.myModules.system = {
    enable = mke "Enable 'system' NixOS module group";

    bootloader = {
      enable = mke "Enable bootloader module";
      useLatestKernel = mke "Use the latest kernel";
    };

    display = {
      enable = mke "Enable basic display settings";
      hyprland.enable = mke "Enable basic hyprland (configuration is a home module)";
      plasma.enable = mke "Enable KDE plasma module";
      sddm.enable = mke "Enable SDDM module";
    };

    hardware = {
      enable = mke "Enable hardware module";
      bluetooth.enable = mke "Enable bluetooth";
      laptop.enable = mke "Enable some settings for laptops";
      printing.enable = mke "Enable printing";
      sound.enable = mke "Enable sound";
    };

    mainUser = {
      enable = mke "Enable main user module";
      userName = lib.mkOption {
        default = "zdbg";
        description = "Main user username";
      };
    };

    locale.enable = mke "Enable locale module";
    network.enable = mke "Enable network module";
    packages.enable = mke "Enable packages module";
    security.enable = mke "Enable security module";
    store.enable = mke "Enable nix store module";
    zsh.enable = mke "Enable zsh";
  };

  config.myModules.system = {
    bootloader = {
      enable = lmd cfg.enable;
      useLatestKernel = lmd cfg.bootloader.enable;
    };

    display = {
      enable = lmd cfg.enable;
      # hyprland.enable = lmd cfg.display.enable;
      # plasma.enable = lmd cfg.display.enable;
      sddm.enable = lmd cfg.display.enable;
    };

    hardware = {
      enable = lmd cfg.enable;
      # bluetooth.enable = lmd cfg.hardware.enable;
      # laptop.enable = lmd cfg.hardware.enable;
      printing.enable = lmd cfg.hardware.enable;
      sound.enable = lmd cfg.hardware.enable;
    };

    mainUser.enable = lmd cfg.enable;

    locale.enable = lmd cfg.enable;
    network.enable = lmd cfg.enable;
    packages.enable = lmd cfg.enable;
    security.enable = lmd cfg.enable;
    store.enable = lmd cfg.enable;
    zsh.enable = lmd cfg.enable;
  };
}
