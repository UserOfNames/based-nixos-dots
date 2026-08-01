{ config, lib, ... }:

let
  cfg = config.myHomeModules.utilities.fzf;
in {
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = config.myHomeModules.system.fish.enable;
    };
  };
}
