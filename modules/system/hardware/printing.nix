{ config, lib, ... }:

let
  cfg = config.myModules.system.hardware.printing;
in {
  config = lib.mkIf cfg.enable {
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
