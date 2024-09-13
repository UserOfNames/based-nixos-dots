{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules" "utilities" ];

  cfg = config.myHomeModules.utilities;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden
      foliate
      nomacs
      qalculate-qt
      trashy
    ];

    myHomeModules.utilities = {
      btop.enable = lmd cfg.enable;
      firefox.enable = lmd cfg.enable;
      fzf.enable = lmd cfg.enable;
      git.enable = lmd cfg.enable;
      kitty.enable = lmd cfg.enable;
      mpd.enable = lmd cfg.enable;
      mpv.enable = lmd cfg.enable;
      ncmpcpp.enable = lmd cfg.enable;
      neovim.enable = lmd cfg.enable;
      syncthing.enable = lmd cfg.enable;
      tmux.enable = lmd cfg.enable;
      yazi.enable = lmd cfg.enable;
      zathura.enable = lmd cfg.enable;
    };
  };
}
