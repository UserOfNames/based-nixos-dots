{ config, lib, ... }:

{
  options = {
    myHomeModules.newsboat.enable = lib.mkEnableOption "Enable newsboat module";
  };

  config = lib.mkIf config.myHomeModules.newsboat.enable {
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
