{ config, osConfig, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "other" ];
  };

  cfg = config.myHomeModules.other;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
    };
  };
}
