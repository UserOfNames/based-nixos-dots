{ config, lib, ... }:
let
  cfg = config.myModules.system.user;
in {
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "Main user";
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "syncthing" ];
    };
  };
}
