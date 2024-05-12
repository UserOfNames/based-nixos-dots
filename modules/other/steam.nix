{ config, pkgs, lib, ... }:

{
  options = {
    module-steam.enable = lib.mkEnableOption "Enable steam module";
  };

  config = lib.mkIf config.module-steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
