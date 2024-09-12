{ config, lib, ... }:

let
  cfg = config.myHomeModules.other.stylix;
in {
  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;

      targets = {
        bemenu.enable = false;
        nixvim.enable = false;
        kde.enable = false;
        tmux.enable = false;
        waybar.enable = false;
      };
    };
  };
}
