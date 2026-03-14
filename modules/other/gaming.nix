{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.other.gaming;
in {
  config = lib.mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;

        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };

      # NOTE: I haven't been using this, so I'm keeping it off for now.
      # gamescope.enable = true;
    };
  };
}
