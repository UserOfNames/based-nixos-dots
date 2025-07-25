{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "productivity" ];
  };

  cfg = config.myHomeModules.productivity;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      obs-studio
    ];
  };
}
