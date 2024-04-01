{ config, pkgs, lib, ... }:

{
  options = {
    module-steam.enable = lib.mkEnableOption "Enables steam";
  };

  config = lib.mkIf config.module-steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
