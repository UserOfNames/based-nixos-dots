{ config, lib, pkgs, ... }:

let
  cfg = config.myModules.utilities.wireshark;
in {
  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };
}
