{ config, pkgs, ...}:

{
  services.mako = {
    enable = true;
    font = "JetBrainsMono 10";
    defaultTimeout = 10000;
  };
}
