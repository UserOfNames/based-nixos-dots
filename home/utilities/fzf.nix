{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.fzf;
  cfgZsh = config.myHomeModules.system.zsh;
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = config.myHomeModules.system.zsh.enable;
    };

    programs.zsh = lib.mkIf cfgZsh.enable {
      shellAliases = {
        s = "cd `hash -d | fzf | sed 's/^.*=//'`";
      };

      initExtra = "bindkey -s '^f' 'cd $(find ~/Projects ~/Documents ~/.nixosdots -mindepth 1 -type d | fzf)\n'";
    };
  };
}
