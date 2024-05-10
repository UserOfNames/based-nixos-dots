{ config, pkgs, lib, ... }:

{
  options = {
    module-environment.enable = lib.mkEnableOption "Enable environment module";
  };

  config = lib.mkIf config.module-environment.enable {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "foot";
    };
  };
}
