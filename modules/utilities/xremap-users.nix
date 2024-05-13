{ config, pkgs, lib, ... }:

{
  options = {
    myModules.xremapusers.enable = lib.mkEnableOption "Enable xremapusers module";
  };

  config = lib.mkIf config.myModules.xremapusers.enable {
    hardware.uinput.enable = true;
    users.groups = {
      uinput.members = [ "zdbg" ];
      input.members = [ "zdbg" ];
    };
  };
}
