{ config, pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./utilities
    ./system
  ];
}
