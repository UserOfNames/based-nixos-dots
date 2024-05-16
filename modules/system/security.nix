{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.security.enable = lib.mkEnableOption "Enable security module";
  };

  config = lib.mkIf config.myModules.system.security.enable {
    security = {
      # sudo: show password feedback, force root password
      sudo = {
        extraConfig = ''
          Defaults pwfeedback
          Defaults rootpw
        '';
      };
    };
  };
}
