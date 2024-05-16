{ config, pkgs, lib, ... }:

{
  options.myModules.user = {
    enable = lib.mkEnableOption "Enable main user module";

    userName = lib.mkOption {
      default = "zdbg";
      description = "zdbg";
    };
  };

  config = lib.mkIf config.myModules.user.enable {
    users.users.${config.myModules.user.userName} = {
      isNormalUser = true;
      description = "Main user";
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
