{ config, pkgs, lib, ... }:

{
  imports = [
    ./virtualization.nix
    ./xremap-users.nix
  ];

  module-xremapusers.enable = lib.mkDefault true;
}
