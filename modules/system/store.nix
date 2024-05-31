{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.store;
in {
  config = lib.mkIf cfg.enable {
    nix = {
      optimise = {
        automatic = true;
        dates = [
          "weekly"
        ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
