{ config, pkgs, ... }:

{
  hardware.uinput.enable = true;
  users.groups = {
    uinput.members = [ "zdbg" ];
    input.members = [ "zdbg" ];
  };
}
