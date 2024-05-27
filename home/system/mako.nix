{ config, pkgs, lib, ...}:

{
  options = {
    myHomeModules.system.mako.enable = lib.mkEnableOption "Enable mako user configuration";
  };

  config = lib.mkIf config.myHomeModules.system.mako.enable {
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
