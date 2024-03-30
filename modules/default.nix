{ config, pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./user.nix
  ];
}
