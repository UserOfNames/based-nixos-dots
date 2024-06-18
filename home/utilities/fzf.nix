{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.fzf;
  cfgZsh = config.myHomeModules.system.zsh;
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = lib.mkIf cfgZsh.enable true;
    };
  };
}
