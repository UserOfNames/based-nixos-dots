{ config, lib, pkgs, ... }:

let
  cfg = config.myHomeModules.other.gaming;
in {
  config = lib.mkIf cfg.enable {
    programs.mangohud = {
      enable = true;

      settings = {
        fps_limit = 240;
        no_display = true;
      };
    };

    programs.lutris = {
      enable = true;

      protonPackages = with pkgs; [
        proton-ge-bin
      ];

      defaultWinePackage = pkgs.proton-ge-bin;

      extraPackages = with pkgs; [
        umu-launcher
      ];
    };
  };
}
