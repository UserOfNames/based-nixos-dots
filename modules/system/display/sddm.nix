{ config, pkgs, lib, ... }:

{
  options = {
    myModules.system.display.sddm.enable = lib.mkEnableOption "Enable sddm module";
  };

  config = lib.mkIf config.myModules.system.display.sddm.enable {
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
