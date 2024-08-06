{ config, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myHomeModules.productivity;
in {
  options.myHomeModules.productivity = {
    enable = mke "Enable 'productivity home module group";
  };

  config.myHomeModules.productivity = {
  };
}
