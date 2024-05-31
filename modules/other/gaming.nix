{ config, pkgs, lib, ... }:

let cfg = config.myModules.other.gaming; in {
  options = {
    myModules.other.gaming = {
      enable = lib.mkEnableOption "Enable gaming module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
