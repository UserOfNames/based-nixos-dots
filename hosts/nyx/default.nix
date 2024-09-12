{ pkgs, inputs, myLib, ... }:

let
  hostName = "nyx";
  userName = "zdbg";
  homeFile = ./home.nix;
  diskoDevice = "/dev/nvme0n1";
in {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = diskoDevice; })
  ];

  networking.hostName = hostName;

  home-manager = myLib.mkHome userName homeFile;

  environment.systemPackages = with pkgs; [
    tor-browser
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  myModules = {
    system = {
      enable = true;

      mainUser = {
        userName = userName;
      };

      hardware = {
        bluetooth.enable = true;
      };

      display = {
        plasma.enable = true;
      };
    };

    other = {
      enable = true;
    };

    utilities = {
      enable = true;
      virtualization.enable = true;
    };
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "24.05";
}
