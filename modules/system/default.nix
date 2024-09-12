{ config, lib, myLib, ... }:

let
  cfg = config.myModules.system;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myModules.system = {
    enable = mke "Enable 'system' NixOS module group";

    mainUser = {
      enable = mke "Enable main user module";
      userName = lib.mkOption {
        default = "zdbg";
        description = "Main user username";
      };
    };

    bootloader.enable = mke "Enable bootloader module";
    locale.enable = mke "Enable locale module";
    network.enable = mke "Enable network module";
    packages.enable = mke "Enable packages module";
    security.enable = mke "Enable security module";
    store.enable = mke "Enable nix store module";
    zsh.enable = mke "Enable zsh";
  };

  config = lib.mkIf cfg.enable {
    myModules.system = {
      mainUser.enable = lmd cfg.enable;

      bootloader.enable = lmd cfg.enable;
      locale.enable = lmd cfg.enable;
      network.enable = lmd cfg.enable;
      packages.enable = lmd cfg.enable;
      security.enable = lmd cfg.enable;
      store.enable = lmd cfg.enable;
      zsh.enable = lmd cfg.enable;
    };
  };
}
