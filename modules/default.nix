{ config, pkgs, ... }:

{
  imports = [
    ./desktop
    ./system
    ./utilities
  ];
}
