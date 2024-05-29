{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.syncthing.enable = lib.mkEnableOption "Enable syncthing module";
  };

  config = lib.mkIf config.myModules.utilities.syncthing.enable {
    environment.systemPackages = [ pkgs.syncthing ];
    services.syncthing = {
      enable = true;
      overrideFolders = false;
      overrideDevices = false;
      relay.enable = false;
      openDefaultPorts = true;
    };
  };
}
