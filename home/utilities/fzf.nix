{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.fzf;
  cfgZsh = config.myHomeModules.system.zsh;
  shortcut = "cd `hash -d | fzf | sed 's/^.*=//'`";
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = config.myHomeModules.system.zsh.enable;

    };

    programs.zsh = {
      shellAliases = lib.mkIf cfgZsh.enable {
        s = shortcut;
      };
    };
  };
}
