{ config, ... }:

{
  programs.yt-dlp = {
    enable = true;

    settings = {
      format = "bv*+ba/b";
      merge-output-format = "mkv";
      no-mtime = true;
      output = "~/YTDLP/%(title)s.%(ext)s";
    };
  };
}
