{ config, pkgs, lib, ...}:

{
  options = {
    myHomeModules.mako.enable = lib.mkEnableOption "Enable mako module";
  };

  config = lib.mkIf config.myHomeModules.mako.enable {
    services.mako = {
      enable = true;
      font = "JetBrainsMono 10";
      defaultTimeout = 10000;
    };
  };
}
