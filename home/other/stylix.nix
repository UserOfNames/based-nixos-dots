{ config, pkgs, lib, ... }:

let
  # Home and system stylix modules must be activated together
  cfg = config.myModules.other.stylix;
in {
  config = lib.mkIf cfg.enable {
    stylix = {
      autoEnable = true;
      targets = {
        bemenu.enable = false;
        tmux.enable = false;
        waybar.enable = false;
      };
    };
  };
}
