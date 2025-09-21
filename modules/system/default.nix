{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myModules" "system" ];
  };

  cfg = config.myModules.system;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
  };
}
