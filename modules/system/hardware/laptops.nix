{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.hardware.laptops;
in {
  config = lib.mkIf cfg.enable {
    services.libinput.enable = true;
  };
}
