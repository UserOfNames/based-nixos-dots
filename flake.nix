{
  description = "NixOS configuration with home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nur.url = "github:nix-community/nur";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
    disko,
    ...
  }@inputs:
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
