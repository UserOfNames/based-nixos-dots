{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.bootloader.enable = lib.mkEnableOption "Enable bootloader module";
  };

  config = lib.mkIf config.myModules.system.bootloader.enable {
    boot = {
      supportedFilesystems = [ "ntfs" ];

      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 20;
          editor = false;
        };

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };

        timeout = 10;
      };
    };
  };
}
