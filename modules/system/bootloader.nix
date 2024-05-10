{ config, pkgs, lib, ... }:

{
  options = {
    module-bootloader.enable = lib.mkEnableOption "Enable bootloader module";
  };

  config = lib.mkIf config.module-bootloader.enable {
    # Systemd-boot, maximum 20 generations
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
