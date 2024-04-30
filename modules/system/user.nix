{ config, pkgs, lib, ... }:

{
  # Credits to Vimjoyer on youtube for the generic main user concept and structure
  options.module-main-user = {
    enable = lib.mkEnableOption "Enable user module";

    userName = lib.mkOption {
      default = "zdbg";
      description = "zdbg";
    };
  };

  config = lib.mkIf config.module-main-user.enable {
    users.users.${config.module-main-user.userName} = {
      isNormalUser = true;
      description = "Main user";
      initialPassword = "CHANGENOW";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
