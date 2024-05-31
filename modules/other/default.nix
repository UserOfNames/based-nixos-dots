{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.other;
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./gaming.nix
  ];

  config = lib.mkIf cfg.enable {
    myModules.other = {
      gaming = {
        enable = dtrue;
        # minecraft.enable = dtrue;
      };
    };
  };
}
