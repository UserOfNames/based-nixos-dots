{ config, pkgs, ... }:

{
  programs.lf = {
    enable = true;

    commands = {
      editor-open = ''$$EDITOR $f'';
    };
  };
}
