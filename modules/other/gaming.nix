{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.other.gaming;
in {
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
