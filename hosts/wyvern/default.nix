{ pkgs, inputs, myLib, ... }:

let
  userName = "zdbg";
  homeFile = ./home.nix;
  dotsPath = "/home/${userName}/.nixosdots";
in {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ];

  home-manager = myLib.mkHome userName homeFile;

  environment.systemPackages = with pkgs; [
    tor-browser
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  scripts = {
    enable = true;
  };

  myModules = {
    inherit dotsPath;

    other = {
      enable = true;
      gaming.enable = true;
    };

    system = {
      enable = true;

      mainUser = {
        inherit userName;
      };

      hardware = {
        bluetooth.enable = true;
        laptop.enable = true;
      };

      display = {
        hyprland.enable = true;
      };
    };

    utilities = {
      enable = true;
      thunar.enable = true;
      virtualization.enable = true;
    };
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "25.05";
}
