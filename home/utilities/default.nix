{ config, pkgs, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "utilities" ];
  };

  cfg = config.myHomeModules.utilities;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden
      foliate
      nomacs
      qalculate-qt
      trashy
    ];
  };
}
