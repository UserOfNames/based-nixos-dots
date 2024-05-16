{ config, pkgs, lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./virtualization.nix
    ./xremap-users.nix
  ];

  myModules.utilities = {
    xremapusers.enable = dtrue;
  };
}
