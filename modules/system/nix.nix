{ config, lib, inputs, ... }:

let
  cfg = config.myModules.system.nix;
in {
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nix = {
      nixPath = [ "nixpkgs = ${inputs.nixpkgs}" ];

      optimise = {
        automatic = true;
        persistent = true;
        dates = "weekly";
      };

      gc = {
        automatic = true;
        persistent = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
