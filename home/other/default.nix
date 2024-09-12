{ config, lib, myLib, ... }:

let
  cfg = config.myHomeModules.other;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myHomeModules.other = {
    enable = mke "Enable 'other' home module group";
    fastfetch.enable = mke "Enable fastfetch";
    newsboat.enable = mke "Enable newsboat";
    stylix.enable = mke "Enable stylix home module";
    ytdlp.enable = mke "Enable YT-DLP";
  };

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      fastfetch.enable = lmd cfg.enable;
      newsboat.enable = lmd cfg.enable;
      stylix.enable = lmd cfg.enable;
      ytdlp.enable = lmd cfg.enable;
    };
  };
}
