{ config, pkgs, lib, ... }:

{
  options = {
    module-xremapusers.enable = lib.mkEnableOption "Enable xremapusers module";
  };

  config = lib.mkIf config.module-xremapusers.enable {
    hardware.uinput.enable = true;
    users.groups = {
      uinput.members = [ "zdbg" ];
      input.members = [ "zdbg" ];
    };
  };
}
