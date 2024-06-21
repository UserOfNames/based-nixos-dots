{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.zathura;
in {
  config = lib.mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      options = {
      };
    };
  };
}
