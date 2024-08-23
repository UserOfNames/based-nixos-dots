{ config, lib, ... }:
let
  cfg = config.myModules.system.mainUser;
in {
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "zdbg";
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "syncthing" ];
    };
  };
}
