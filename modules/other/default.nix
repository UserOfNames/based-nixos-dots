{ config, lib, myLib, ... }:

let
  cfg = config.myModules.other;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myModules.other = {
    enable = mke "Enable 'other' NixOS module group";
    gaming.enable = mke "Enable gaming module";
    stylix.enable = mke "Enable stylix";
  };

  config = lib.mkIf cfg.enable {
    myModules.other = {
      gaming.enable = lmd cfg.enable;
      stylix.enable = lmd cfg.enable;
    };
  };
}
