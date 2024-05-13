{ config, lib, ... }:

{
  options = {
    myHomeModules.ytdlp.enable = lib.mkEnableOption "Enable ytdlp module";
  };

  config = lib.mkIf config.myHomeModules.ytdlp.enable {
    programs.yt-dlp = {
      enable = true;

      settings = {
        format = "bv*+ba/b";
        merge-output-format = "mkv";
        no-mtime = true;
        output = "~/YTDLP/%(title)s.%(ext)s";
      };
    };
  };
}
