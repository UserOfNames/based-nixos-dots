{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.productivity;
in {
  imports = [
    ../../options.nix
  ];

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      calcurse
      libreoffice-fresh
      obs-studio
    ];
  };
}
