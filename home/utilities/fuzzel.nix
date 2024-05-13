{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.fuzzel.enable = lib.mkEnableOption "Enable fuzzel module";
  };

  config = lib.mkIf config.myHomeModules.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          layer = "top";
          font = "JetBrainsMono:size=10";
        };

        colors = {
          background = "1a1b26dd";
          text = "c0caf5ff";
          match = "9ece6aff";
          selection = "283457dd";
          selection-text = "c0caf5ff";
          selection-match = "9ece6aff";
          border = "ffffffff";
        };

        border = {
          width = 1;
        };
      };
    };
  };
}
