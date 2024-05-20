{ config, pkgs, lib, inputs, ... }:

{
  options = {
    myHomeModules.utilities.lf.enable = lib.mkEnableOption "Enable lf user configuration";
  };

  config = lib.mkIf config.myHomeModules.utilities.lf.enable {
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
        info = "size";
        ifs = "\n";
        scrolloff = 8;

        previewer = "${pkgs.ctpv}/bin/ctpv";
        cleaner = "${pkgs.ctpv}/bin/ctpvclear";
      };

      commands = {
        drag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x $fx'';
        open-editor = ''$$EDITOR "$f"'';
        edit-dir = ''$$EDITOR .'';
        mkfile = ''%touch "$@"'';
        mkdir = ''%mkdir "$@"'';
        trash = ''%trash put $fx'';
      };

      extraConfig = ''
        &${pkgs.ctpv}/bin/ctpv -s $id
        cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
      '';

      keybindings = {
        "D" = "trash";
        "E" = "edit-dir";
        "o" = "push :mkfile<space>";
        "O" = "push :mkdir<space>";
        "~" = "drag-out";
      };
    };
  };
}
