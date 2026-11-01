{ config, lib, ... }:

let
  cfg = config.myHomeModules.other.discord;
in {
  config = lib.mkIf cfg.enable {
    programs.discord = {
      enable = true;
    };
  };
}
