{ config, pkgs, lib, ... }:

{
  options = {
    myModules.environment.enable = lib.mkEnableOption "Enable environment module";
  };

  config = lib.mkIf config.myModules.environment.enable {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "foot";
    };
  };
}
