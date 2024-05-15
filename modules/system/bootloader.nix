{ config, pkgs, lib, ... }:

{
  options = {
    myModules.bootloader.enable = lib.mkEnableOption "Enable bootloader module";
  };

  config = lib.mkIf config.myModules.bootloader.enable {
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
