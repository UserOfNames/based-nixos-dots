{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "foot";
  };
}
