{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "system" ];
    excludeConfigs = [
      "hyprland"
    ];
  };

  cfg = config.myHomeModules.system;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
