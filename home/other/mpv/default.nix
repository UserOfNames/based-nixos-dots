{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      profile = "high-quality";
      force-window = true;
    };
  };
}
