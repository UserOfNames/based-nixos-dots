{ config, pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./common
  ];
}