{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.utilities.xremapusers;
in {
  config = lib.mkIf cfg.enable {
    hardware.uinput.enable = true;
    users.groups = {
      uinput.members = [ "zdbg" ];
      input.members = [ "zdbg" ];
    };
  };
}
