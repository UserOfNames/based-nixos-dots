{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myHomeModules.utilities;
in {
  options.myHomeModules.utilities = {
    enable = mke "Enable 'utilities' home module group";
    btop.enable = mke "Enable btop";
    firefox.enable = mke "Enable firefox";
    fzf.enable = mke "Enable fzf";
    git.enable = mke "Enable git";
    kitty.enable = mke "Enable kitty";
    mpd.enable = mke "Enable mpd";
    mpv.enable = mke "Enable mpv";
    ncmpcpp.enable = mke "Enable ncmpcpp";
    neovim.enable = mke "Enable neovim";
    syncthing.enable = mke "Enable syncthing user service";
    tmux.enable = mke "Enable tmux";
    yazi.enable = mke "Enable yazi";
    zathura.enable = mke "Enable zathura";
  };

  config.myHomeModules.utilities = {
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
}
