{ config, pkgs, lib, ... }:

let
  dtrue = lib.mkDefault true;
in {
  imports = [
    ../../options.nix
    ./gaming.nix
  ];

  config = {
    myModules.other = lib.mkIf config.myModules.other.enable {
      gaming = {
        enable = dtrue;
        # minecraft.enable = dtrue;
      };
    };
  };
}
