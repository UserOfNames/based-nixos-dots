{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.scripts;
in {
  options.scripts = {
    enable = mke "Enable scripts";
    fzf-cd-common.enable = mke "Enable script to fzf + cd over important directories";
    tmux-sessionizer.enable = mke "Enable tmux-sessionizer script by Primeagen";
  };

  config.scripts = {
    enable = lmd true;
    fzf-cd-common.enable = lmd cfg.enable;
    tmux-sessionizer.enable = lmd cfg.enable;
  };
}
