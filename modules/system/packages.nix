{ config, lib, ... }:

let
  cfg = config.myModules.system.packages;
in {
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
