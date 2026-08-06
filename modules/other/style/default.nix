{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "other" "style" ];
  };

  cfg = config.myModules.other.style;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
