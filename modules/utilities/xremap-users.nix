{ config, pkgs, lib, ... }:

{
  options = {
    myModules.utilities.xremapusers.enable = lib.mkEnableOption "Enable xremapusers module";
  };

  config = lib.mkIf config.myModules.utilities.xremapusers.enable {
    hardware.uinput.enable = true;
    users.groups = {
      uinput.members = [ "zdbg" ];
      input.members = [ "zdbg" ];
    };
  };
}
