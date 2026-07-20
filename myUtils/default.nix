{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myUtils" ];
  };

  cfg = config.myUtils;
in {
  imports = [] ++ modules;

  options.myUtils = {
    enable = lib.mkEnableOption "Enable my utilities";
  };

  config = lib.mkIf cfg.enable {
  };
}
