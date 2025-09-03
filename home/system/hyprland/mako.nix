{ config, lib, myLib, ...}:

let
  cfg = config.myHomeModules.system.hyprland.mako;
in {
  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;

      settings = with myLib.base16Scheme; {
        default-timeout = 10000;

        background-color = "#${base00}";
        border-color = "#${base0D}";

        font = "monospace 10";

        border-radius = 1;
      };
    };
  };
}
