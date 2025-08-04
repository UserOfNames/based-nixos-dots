{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.rmpc;
in {
  config = lib.mkIf cfg.enable {
    programs.rmpc = {
      enable = true;

      config = ''
        (
          volume_step: 2,
        )
      '';
    };
  };
}
