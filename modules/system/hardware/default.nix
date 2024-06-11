{ lib, ... }:

{
  imports = [
    ./bluetooth.nix
    ./laptop.nix
    ./printing.nix
    ./sound.nix
  ];
}
