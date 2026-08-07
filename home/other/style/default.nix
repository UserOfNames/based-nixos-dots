{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "other" "style" ];
  };

  cfg = config.myHomeModules.other.style;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      gtk2.force = true;
      gtk4.theme = null;
    };

    qt.enable = true;
  };
}
