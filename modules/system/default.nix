{ config, pkgs, lib, ... }:

{
  imports = [
    ./bootloader.nix
    ./display.nix
    ./fonts.nix
    ./environment.nix
    ./hardware.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./store.nix
    ./user.nix
    ./zsh.nix
  ];

  module-bootloader.enable = lib.mkDefault true;
  module-display.enable = lib.mkDefault true;
  module-fonts.enable = lib.mkDefault true;
  module-environment.enable = lib.mkDefault true;
  module-hardware.enable = lib.mkDefault true;
  module-locale.enable = lib.mkDefault true;
  module-network.enable = lib.mkDefault true;
  module-packages.enable = lib.mkDefault true;
  module-security.enable = lib.mkDefault true;
  module-store.enable = lib.mkDefault true;
  module-user.enable = lib.mkDefault true;
  module-zsh.enable = lib.mkDefault true;
}
