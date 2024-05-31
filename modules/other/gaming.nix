{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.other.gaming;
in {
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
