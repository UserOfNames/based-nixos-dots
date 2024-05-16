{ config, pkgs, lib, ... }:

{
  options = {
    myModules.gaming.enable = lib.mkEnableOption "Enable gaming module";
  };

  config = lib.mkIf config.myModules.gaming.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
