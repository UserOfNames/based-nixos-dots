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

      {
        title = "Luke Smith";
        url = "https://lukesmith.xyz/index.xml";
        tags = [
          "Linux"
          "Tech"
          "Ideas"
        ];
      }
    ];
  };
}
