{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.other.ncmpcpp;
in {
  config = lib.mkIf cfg.enable {
    programs.ncmpcpp = {
      enable = true;

      settings = {
        media_library_primary_tag = "album_artist";
      };

      bindings = [
        { key = "j"; command = "scroll_down"; }
        { key = "k"; command = "scroll_up"; }
        { key = "J"; command = [ "select_item" "scroll_down" ]; }
        { key = "K"; command =[ "select_item" "scroll_up" ]; }
        { key = "ctrl-u"; command = "page_up"; }
        { key = "ctrl-d"; command = "page_down"; }
        { key = "h"; command = "previous_column"; }
        { key = "l"; command = "next_column"; }

        { key = "space"; command = "select_item"; }

        { key = "."; command = "show_lyrics"; }

        { key = "n"; command = "next_found_item"; }
        { key = "N"; command = "previous_found_item"; }

        { key = "left"; command = "seek_backward"; }
        { key = "right"; command = "seek_forward"; }
        { key = "down"; command = "volume_down"; }
        { key = "up"; command = "volume_up"; }
      ];
    };
  };
}
