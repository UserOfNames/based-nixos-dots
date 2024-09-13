{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "other" ];
    excludeConfigs = [
      "gaming"
    ];
  };

  cfg = config.myModules.other;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
