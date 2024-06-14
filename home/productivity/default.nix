{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.productivity;
  dtrue = lib.mkDefault true;
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

    myHomeModules.productivity = {
    };
  };
}
