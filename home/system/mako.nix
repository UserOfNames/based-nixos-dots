{ config, pkgs, lib, ...}:

let
  cfg = config.myHomeModules.system.mako;
in {
  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      font = "JetBrainsMono 10";
      defaultTimeout = 10000;
      backgroundColor = "#1a1b26ff";
      borderColor = "#ffffffff";
      textColor = "#c0caf5ff";
    };
  };
}
