{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.utilities.syncthing.enable = lib.mkEnableOption "Enable syncthing home configuration";
  };

  config = lib.mkIf config.myHomeModules.utilities.syncthing.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
