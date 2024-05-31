{ config, pkgs, lib, ... }:

let
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./thunar.nix
    ./virtualization.nix
    ./xremap-users.nix
  ];

  config = {
    myModules.utilities = lib.mkIf config.myModules.utilities.enable {
      # thunar.enable = dtrue;
      # virtualization.enable = dtrue;
      xremapusers.enable = dtrue;
    };
  };
}
