{ config, lib, myLib, ... }:

let
  modules = myLib.importModulesIn {
    inherit config;
    dir = ./.;
    base = [ "scripts" ];
  };

  mke = lib.mkEnableOption;
  cfg = config.scripts;
in {
  imports = [] ++ modules;

  options.scripts = {
    enable = mke "Enable scripts";
  };

  config = lib.mkIf cfg.enable {
  };
}
