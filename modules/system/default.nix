{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system;
in {
  imports = [
    ../../options.nix
    ./display
    ./hardware
    ./bootloader.nix
    # ./fonts.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./store.nix
    ./user.nix
    ./zsh.nix
  ];
}
