{ config, osConfig, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "myHomeModules" "other" ];
    excludeConfigs = [
      "stylix"
    ];
  };

  cfg = config.myHomeModules.other;
in {
  imports = [] ++ modules;

  config = lib.mkIf cfg.enable {
    myHomeModules.other = {
      stylix = {
        # By default, enable stylix features for home-manager if and only if it
        # is enabled for NixOS
        enable = lib.mkDefault osConfig.myModules.other.stylix.enable;
      };
    };
  };
}
