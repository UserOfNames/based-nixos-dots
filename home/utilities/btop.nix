{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.btop;
in {
  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
  };
}
