{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "system" "hardware" ];
    excludeConfigs = [
      "bluetooth"
      "laptop"
    ];
  };

  cfg = config.myModules.system.hardware;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
