{ config, ... }:

{
  programs.newsboat = {
    enable = true;
    autoReload = true;

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
