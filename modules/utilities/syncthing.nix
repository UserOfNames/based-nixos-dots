{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.syncthing.enable = lib.mkEnableOption "Enable syncthing module";
  };

  config = lib.mkIf config.myModules.utilities.syncthing.enable {
    environment.systemPackages = [ pkgs.syncthing ];
    # services.syncthing does not currently work.
    # services.syncthing = {
    #   enable = true;
    #   user = "zdbg";
    # };
  };
}
