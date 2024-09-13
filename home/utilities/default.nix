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
      btop.enable = lmd true;
      firefox.enable = lmd true;
      fzf.enable = lmd true;
      git.enable = lmd true;
      kitty.enable = lmd true;
      mpd.enable = lmd true;
      mpv.enable = lmd true;
      ncmpcpp.enable = lmd true;
      neovim.enable = lmd true;
      syncthing.enable = lmd true;
      tmux.enable = lmd true;
      yazi.enable = lmd true;
      zathura.enable = lmd true;
    };
  };
}
