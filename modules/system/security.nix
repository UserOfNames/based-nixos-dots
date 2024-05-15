{ config, pkgs, lib, ... }:

{
  options = {
    myModules.security.enable = lib.mkEnableOption "Enable security module";
  };

  config = lib.mkIf config.myModules.security.enable {
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
