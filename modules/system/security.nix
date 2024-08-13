{ config, lib, ... }:

let
  cfg = config.myModules.system.security;
in {
  config = lib.mkIf cfg.enable {
    security = {
      sudo = {
        extraConfig = ''
          Defaults pwfeedback
          Defaults rootpw
        '';
      };
    };
  };
}
