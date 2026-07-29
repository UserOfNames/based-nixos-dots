{ inputs, ... }:

let
  lib = inputs.nixpkgs.lib;

  myLib =
    (import ./builders.nix { inherit inputs lib myLib; }) //
    (import ./files.nix { inherit lib; }) //
    (import ./modules.nix { inherit lib myLib; }) //
    (import ./utils.nix { inherit lib; });
in
  myLib
