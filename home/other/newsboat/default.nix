{ config, lib, ... }:

let
  cfg = config.myHomeModules.other.newsboat;

  mkFeed = title: url: tags:
    { inherit title url tags; };
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "newsboat/colors".source = ./colors;
    };

    programs.newsboat = {
      enable = true;
      autoReload = true;

      extraConfig = ''
        include ./colors
        bind-key j down
        bind-key k up
      '';

      urls = [
      ];
    };
  };
}
