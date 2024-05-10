{ config, pkgs, lib, ... }:

{
  options = {
    module-security.enable = lib.mkEnableOption "Enable security module";
  };

  config = lib.mkIf config.module-security.enable {
    security = {
      # Sudo configuration (show password feedback)
      sudo = {
        extraConfig = ''
          Defaults pwfeedback
          Defaults rootpw
        '';
      };
    };
  };
}
