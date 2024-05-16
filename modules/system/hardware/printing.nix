{ config, pkgs, lib, ... }:

{
  options = {
    myModules.hardware.printing.enable = lib.mkEnableOption "Enable printing module";
  };

  config = lib.mkIf config.myModules.hardware.printing.enable {
    # avahi is for autodiscovery of printers
    # Port 5353 is opened
    services = {
      printing.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
