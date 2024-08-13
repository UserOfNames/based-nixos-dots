{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.syncthing;
in {
  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
