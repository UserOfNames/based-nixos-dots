{ config, pkgs, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "";
    homeDirectory = "";
    stateVersion = "";

    packages = with pkgs; [
    ];
  };

  myHomeModules = {
    other = {
      enable = true;
    };

    system = {
      enable = true;
    };

    utilities = {
      enable = true;
    };
  };
}
