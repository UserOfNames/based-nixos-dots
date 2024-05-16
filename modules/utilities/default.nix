{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./virtualization.nix
    ./xremap-users.nix
  ];

  myModules = {
    xremapusers.enable = dtrue;
  };
}
