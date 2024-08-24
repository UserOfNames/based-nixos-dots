{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myHomeModules.productivity;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      calcurse
      libreoffice-fresh
      obs-studio
    ];
  };
}
