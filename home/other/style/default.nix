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
  };
}
