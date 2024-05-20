{ config, pkgs, lib, ... }:

{
  options.myModules.system.user = {
    enable = lib.mkEnableOption "Enable main user module";

    userName = lib.mkOption {
      default = "zdbg";
      description = "zdbg";
    };
  };

  config = lib.mkIf config.myModules.system.user.enable {
    users.users.${config.myModules.system.user.userName} = {
      isNormalUser = true;
      description = "Main user";
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "syncthing" ];
    };
  };
}
