{ config, inputs, myLib, ... }:

let
  userName = config.myModules.system.mainUser.userName;
  hostName = config.networking.hostName;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs myLib; };
    users.${userName} = import ./hosts/${hostName}/home.nix;
  };
}
