{ config, pkgs, lib, ... }:

{
  options = {
    modSteam.enable = lib.mkEnableOption "Enables steam";
  };

  config = lib.mkIf config.modSteam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
