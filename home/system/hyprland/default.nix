{ config, pkgs, lib, myLib, ... }:

let
  files = myLib.importFilesIn ./.;

  cfg = config.myHomeModules.system.hyprland;
in {
  imports = [] ++ files;

  options.myHomeModules.system.hyprland = with lib.types; {
    wallpapers_path = lib.mkOption {
      type = path;
      default = "../../../assets/default_wallpaper.jpg";
      description = "Path to the wallpapers directory";
    };

    numlock_by_default = lib.mkOption {
      type = bool;
      default = true;
      description = "Whether to enable numlock on startup";
    };
  };
  
  config = lib.mkIf cfg.enable {
    # TODO: Remove this
    home.packages = with pkgs; [
      brightnessctl
      cliphist
      grim
      hyprpicker
      j4-dmenu-desktop
      jmtpfs
      slurp
      awww
    ];
  };
}
