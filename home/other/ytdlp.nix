{ config, lib, ... }:

let
  cfg = config.myHomeModules.other.ytdlp;
in {
  config = lib.mkIf cfg.enable {
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
