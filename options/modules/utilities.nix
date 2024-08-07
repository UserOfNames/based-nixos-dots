{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myModules.utilities;
in {
  options.myModules.utilities = {
    enable = mke "Enable 'utilities' NixOS module group";
    thunar.enable = mke "Enable thunar";
    virtualization.enable = mke "Enable virtualization";
  };

  config.myModules.utilities = {
    # thunar.enable = lmd cfg.enable;
    # virtualization.enable = lmd cfg.enable;
  };
}
