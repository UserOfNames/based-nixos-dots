{ config, pkgs, lib, ... }:

{
  options = {
    myModules.steam.enable = lib.mkEnableOption "Enable steam module";
  };

  config = lib.mkIf config.myModules.steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
