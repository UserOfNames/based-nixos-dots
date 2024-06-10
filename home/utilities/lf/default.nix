{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.lf;
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile."lf/icons".source = ./icons;

    programs.lf = {
      enable = true;
      settings = {
        preview = true;
        mouse = true;
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
      };

      extraConfig = let
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.ctpv}/bin/ctpvclear
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in ''
        set previewer ${pkgs.ctpv}/bin/ctpv
        set cleaner ${cleaner}/bin/clean.sh
        &ctpv -s $id
        &ctpvquit $id
      '';

      commands = {
        drag-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x $fx'';
        open-editor = ''$$EDITOR "$f"'';
        edit-dir = ''$$EDITOR .'';
        mkfile = ''%touch "$@"'';
        mkdir = ''%mkdir "$@"'';
        trash = ''%trash put $fx'';
      };

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
