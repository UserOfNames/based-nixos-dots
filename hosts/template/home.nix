{ config, pkgs, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "zdbg";
    homeDirectory = "/home/zdbg";
    stateVersion = "";

    packages = with pkgs; [
    ];
  };
}
