{ config, lib, inputs, ... }:

let
  cfg = config.myModules.system.nix;
in {
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nix = {
      nixPath = [ "nixpkgs = ${inputs.nixpkgs}" ];
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
