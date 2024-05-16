{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.other.ncmpcpp.enable = lib.mkEnableOption "Enable ncmpcpp module";
  };

  config = lib.mkIf config.myHomeModules.other.ncmpcpp.enable {
    programs.ncmpcpp = {
      enable = true;
      bindings = [
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
  };
}
