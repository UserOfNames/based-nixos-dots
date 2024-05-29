{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.other.fastfetch.enable = lib.mkEnableOption "Enable fastfetch module";
  };

  config = lib.mkIf config.myHomeModules.other.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        "display" = {
          "size" = {
            "maxPrefix" = "MB";
            "ndigits" = 0;
          };
        };

        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          {
            type = "display";
            compactType = "original";
            key = "Resolution";
          }
          "de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "terminal"
          {
            type = "terminalfont";
            format = "{/2}{-}{/}{2}{?3} {3}{?}";
          }
          "cpu"
          {
            type = "gpu";
            key = "GPU";
          }
          {
            type = "memory";
            format = "{/1}{-}{/}{/2}{-}{/}{} / {}";
          }
          "break"
        ];
      };
    };
  };
}
