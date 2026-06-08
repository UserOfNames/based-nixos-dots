{ config, lib, ... }:

let
  cfg = config.myModules.utilities.virtualization;
  userName = config.myModules.system.mainUser.userName;
in {
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    users.users.${userName}.extraGroups = [ "libvirtd" ];
  };
}
