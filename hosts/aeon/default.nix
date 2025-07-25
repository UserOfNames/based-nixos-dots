{ pkgs, inputs, myLib, ... }:

let
  userName = "zdbg";
  homeFile = ./home.nix;
  diskoDevice = "/dev/sda";
in {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t520
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = diskoDevice; })
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

  scripts = {
    enable = true;
  };

  myModules = {
    other = {
      enable = true;
      gaming.enable = true;
    };

    system = {
      enable = true;

      mainUser = {
        userName = "zdbg";
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
    };
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "23.11";
}
