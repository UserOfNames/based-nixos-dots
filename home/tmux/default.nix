{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    keyMode = "vi";
  };
}
