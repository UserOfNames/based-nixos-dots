{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./user.nix
    ./zsh.nix
  ];
}
