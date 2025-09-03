{ config, lib, ... }:

let
  cfg = config.myModules.system.hardware.laptop;
in {
  config = lib.mkIf cfg.enable {
    services = {
      libinput.enable = true;
      upower.enable = true;
      tlp.enable = false;
      power-profiles-daemon.enable = true;
    };
  };
}
