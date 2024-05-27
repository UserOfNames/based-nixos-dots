{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.environment.enable = lib.mkEnableOption "Enable environment module";
  };

  config = lib.mkIf config.myModules.system.environment.enable {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
    };
  };
}
