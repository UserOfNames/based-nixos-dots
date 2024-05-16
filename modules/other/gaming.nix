{ config, pkgs, lib, ... }:

{
  options = {
    myModules.other.gaming.enable = lib.mkEnableOption "Enable gaming module";
  };

  config = lib.mkIf config.myModules.other.gaming.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
