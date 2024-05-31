{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.display.sddm;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
  };
}
