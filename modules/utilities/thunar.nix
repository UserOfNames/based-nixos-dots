{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.utilities.thunar;
in {
  config = lib.mkIf cfg.enable {
    services.gvfs.enable = true;
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
        tumbler
      ];
    };
  };
}
