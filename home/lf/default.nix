{ config, pkgs, ... }:

{
  # Credits to Vimjoyer on youtuber for several parts of this config
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {

    enable = true;

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;

      previewer = "${pkgs.ctpv}/bin/ctpv";
      cleaner = "${pkgs.ctpv}/bin/ctpvclear";
    };


    commands = {
      editor-open = ''$$EDITOR $f'';
    };

    keybindings = {
      
    };
  };
}
