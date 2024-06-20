{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.yazi;
in {
  config = lib.mkIf cfg.enable {
    programs.yazi.keymap = {
      #
    };
  };
}
