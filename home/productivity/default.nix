{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn ./. [ "myHomeModules.productivity" ];

  cfg = config.myHomeModules.productivity;
  lmd = lib.mkDefault;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      calcurse
      libreoffice-fresh
      obs-studio
    ];
  };
}
