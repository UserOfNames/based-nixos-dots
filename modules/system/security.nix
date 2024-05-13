{ config, pkgs, lib, ... }:

{
  options = {
    myModules.security.enable = lib.mkEnableOption "Enable security module";
  };

  config = lib.mkIf config.myModules.security.enable {
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
