{ config, pkgs, lib, myLib, ... }:

let
  cfg = config.myHomeModules.productivity;
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
in {
  imports = [] ++ (myLib.importFilesIn ./.);

  options.myHomeModules.productivity = {
    enable = mke "Enable 'productivity home module group";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      calcurse
      libreoffice-fresh
      obs-studio
    ];
  };
}
