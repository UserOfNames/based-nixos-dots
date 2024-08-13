{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.zathura;
in {
  config = lib.mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      options = {
      };
    };

    xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";
  };
}
