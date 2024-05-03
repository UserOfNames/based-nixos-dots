{ config, pkgs, ... }:

{
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
}
