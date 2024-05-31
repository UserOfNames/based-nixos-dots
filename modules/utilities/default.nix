{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.utilities;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./thunar.nix
    ./virtualization.nix
  ];

  config = lib.mkIf cfg.enable {
    myModules.utilities = {
      # thunar.enable = dtrue;
      # virtualization.enable = dtrue;
    };
  };
}
