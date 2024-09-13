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

  config = lib.mkIf cfg.enable {
    scripts = {
      fzf-cd-common.enable = lmd true;
      tmux-sessionizer.enable = lmd true;
    };
  };
}
