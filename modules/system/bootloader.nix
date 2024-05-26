{ config, pkgs, lib, ... }:

let cfg = config.myModules.system.bootloader; in {
  options = {
    myModules.system.bootloader = {
      enable = lib.mkEnableOption "Enable bootloader module";
      useLatestKernel = lib.mkEnableOption "Use the latest kernel";
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = lib.mkIf cfg.useLatestKernel pkgs.linuxPackages_latest;
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
