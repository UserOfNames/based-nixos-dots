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
      number = true;
      relativenumber = true;
      sixel = true;

      previewer = "${pkgs.ctpv}/bin/ctpv";
      cleaner = "${pkgs.ctpv}/bin/ctpvclear";
    };

    commands = {
      ripdrag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x "$fx"'';
      open-editor = ''$$EDITOR $f'';
    };

    extraConfig = ''
      &${pkgs.ctpv}/bin/ctpv -s $id
      cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
    '';

    keybindings = {
    };
  };
}
