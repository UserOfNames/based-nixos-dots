{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "scripts" ];
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.scripts;
in {
  imports = [] ++ modules;

  options.scripts = {
    enable = mke "Enable scripts";
  };

  config.scripts = {
    enable = lmd true;
    fzf-cd-common.enable = lmd cfg.enable;
    tmux-sessionizer.enable = lmd cfg.enable;
  };
}
