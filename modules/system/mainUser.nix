{ config, lib, ... }:
let
  cfg = config.myModules.system.mainUser;
in {
  options.myModules.system.mainUser.userName = lib.mkOption {
    type = lib.types.str;
    description = "Main user username";
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = cfg.userName;
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "syncthing" "wireshark" ];
    };
  };
}
