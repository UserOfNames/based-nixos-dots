{ config, pkgs, lib, ... }:

{
  imports = [
    ./virtualization.nix
    ./xremap-users.nix
  ];

  myModules.xremapusers.enable = lib.mkDefault true;
}
