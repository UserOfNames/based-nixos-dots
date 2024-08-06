{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myModules.other;
in {
  options.myModules.other = {
    enable = mke "Enable 'other' NixOS module group";
    gaming.enable = mke "Enable gaming module";
    stylix.enable = mke "Enable stylix";
  };

  config.myModules.other = {
    gaming.enable = lmd cfg.enable;
    stylix.enable = lmd cfg.enable;
  };
}
