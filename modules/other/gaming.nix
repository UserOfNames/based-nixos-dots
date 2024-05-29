{ config, pkgs, lib, ... }:

let cfg = config.myModules.other.gaming; in {
  options = {
    myModules.other.gaming = {
      enable = lib.mkEnableOption "Enable gaming module";
      minecraft.enable = lib.mkEnableOption "Enable minecraft via prismlauncher";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;

    environment.systemPackages =  with pkgs; lib.mkIf cfg.minecraft.enable [
      prismlauncher
    ];
  };
}
