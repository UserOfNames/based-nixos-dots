{ config, pkgs, ... }:

{
  # Systemd-boot, maximum 20 generations
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 20;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      timeout = 10;
      systemd-boot.editor = false;
    };
  };
}
