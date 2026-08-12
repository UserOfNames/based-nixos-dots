{ config, pkgs, lib, myLib, ... }:

let
  files = myLib.importFilesIn ./.;

  cfg = config.myHomeModules.system.hyprland;

  bluetooth = config.myHomeModules.host.bluetooth;
in {
  imports = [] ++ files;

  options.myHomeModules.system.hyprland = with lib.types; {
    wallpapersPath = lib.mkOption {
      type = path;
      description = "Path to the wallpapers directory";
    };

    numlockByDefault = lib.mkOption {
      type = bool;
      default = true;
      description = "Whether to enable numlock on startup";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      awww
      brightnessctl
      grim
      hyprpicker
      # TODO: Replace
      # jmtpfs
      slurp
    ]
    ++ lib.optionals bluetooth [ bluetui ];

    services.network-manager-applet.enable = true;
  };
}
