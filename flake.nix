{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, nur, disko, stylix, ... }@inputs:
  let
    myLib = import ./myLib {inherit inputs;};
  in with myLib; {
    nixosConfigurations = {
      nyx = mkHost "nyx";
      aeon = mkHost "aeon";
      wyvern = mkHost "wyvern";
    };
  };
}
