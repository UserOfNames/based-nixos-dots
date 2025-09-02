{ config, lib, myLib, ... }:

let
  cfg = config.myHomeModules.utilities.zathura;
in {
  config = lib.mkIf cfg.enable {
    programs.zathura = with myLib.base16Scheme; {
      enable = true;
      options = {
        completion-bg	= "#${base01}";
        completion-fg	= "#${base0D}";
        completion-highlight-bg	= "#${base0D}";
        completion-highlight-fg	= "#${base07}";
        default-bg = "#${base00}";
        default-fg = "#${base01}";
        highlight-active-color = "#${base0D}80";
        highlight-color	= "#${base0A}";
        inputbar-bg	= "#${base00}";
        inputbar-fg	= "#${base07}";
        notification-bg	= "#${base00}";
        notification-error-bg	= "#${base00}";
        notification-error-fg	= "#${base08}";
        notification-fg	= "#${base07}";
        notification-warning-bg	= "#${base00}";
        notification-warning-fg	= "#${base08}";
        recolor-darkcolor	= "#${base06}";
        recolor-lightcolor = "#${base00}";
        statusbar-bg = "#${base02}";
        statusbar-fg = "#${base0A}";
      };
    };

    xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
  };
}
