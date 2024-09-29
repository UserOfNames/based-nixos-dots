{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.hardware.printing;
in {
  config = lib.mkIf cfg.enable {
    services = {
      printing = {
        enable = true;

        drivers = with pkgs; [
          gutenprint
        ];
      };
    };
  };
}
