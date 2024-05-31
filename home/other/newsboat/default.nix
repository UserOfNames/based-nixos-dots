{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.newsboat;
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
        {
          title = "Planet KDE";
          url = "https://planet.kde.org/atom.xml";
          tags = [
            "Linux"
            "Tech"
          ];
        }
      ];
    };
  };
}
