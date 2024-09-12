{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myHomeModules.other;
in {
  options.myHomeModules.other = {
    enable = mke "Enable 'other' home module group";
    fastfetch.enable = mke "Enable fastfetch";
    newsboat.enable = mke "Enable newsboat";
    stylix.enable = mke "Enable stylix home module";
    ytdlp.enable = mke "Enable YT-DLP";
  };

  config.myHomeModules.other = {
    fastfetch.enable = lmd cfg.enable;
    newsboat.enable = lmd cfg.enable;
    stylix.enable = lmd cfg.enable;
    ytdlp.enable = lmd cfg.enable;
  };
}
