{ config, lib, ... }:

let
  cfg = config.myModules.system.hardware.laptop;
in {
  config = lib.mkIf cfg.enable {
    services = {
      libinput.enable = true;
      tlp.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = false;
    };
  };
}
