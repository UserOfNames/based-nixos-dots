{ config, pkgs, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    bindings = [
      # Bindings largely copied from Luke Smith's ncmpcpp/mpd video
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "ctrl-u"; command = "page_up"; }
      { key = "ctrl-d"; command = "page_down"; }
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }

      { key = "."; command = "show_lyrics"; }

      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
    ];
  };
}