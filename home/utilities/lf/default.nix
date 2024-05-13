{ config, pkgs, lib, ... }:

{
  options = {
    myHomeModules.lf.enable = lib.mkEnableOption "Enable lf module";
  };

  config = lib.mkIf config.myHomeModules.lf.enable {
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
        drag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x "$fx"'';
      };

      extraConfig = ''
        &${pkgs.ctpv}/bin/ctpv -s $id
        cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
      '';

      keybindings = {
        x = "delete";
        o = "drag-out";
      };
    };
  };
}
