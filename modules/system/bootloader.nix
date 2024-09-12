{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.bootloader;
in {
  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

      supportedFilesystems = [ "ntfs" ];

      loader = {
        timeout = 10;
        systemd-boot = {
          enable = true;
          configurationLimit = 20;
          editor = false;
        };

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };
  };
}
