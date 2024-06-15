{ config, pkgs, inputs, ... }:

let
  userName = config.myModules.system.user.userName;
  hostName = config.networking.hostName;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${userName} = import ./hosts/${hostName}/home.nix;
  };
}