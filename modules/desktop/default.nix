{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./steam.nix
  ];
}
