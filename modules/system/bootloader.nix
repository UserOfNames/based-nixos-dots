{ config, pkgs, ... }:

{
  # Systemd-boot, maximum 20 generations
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
        editor = false;
      };

      efi = {
        canTouchEfiVariables = true;
        # efi.efiSysMountPoint = "/boot";
      };

      timeout = 10;
    };
  };
}
