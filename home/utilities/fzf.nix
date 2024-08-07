{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.fzf;
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = config.myHomeModules.system.zsh.enable;
    };
  };
}
