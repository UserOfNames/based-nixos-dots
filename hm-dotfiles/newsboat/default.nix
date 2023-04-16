{ config, ... }:

{
  xdg.configFile = {
    "newsboat/colors".source = ./colors;
  };

  programs.newsboat = {

    enable = true;
    autoReload = true;

    extraConfig = ''
      include ./colors
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
      {
        title = "Luke Smith XYZ";
        url = "https://lukesmith.xyz/index.xml";
      }
    ];
  };
}
