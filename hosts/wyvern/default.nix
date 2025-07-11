{ pkgs, inputs, myLib, ... }:

let
  userName = "zdbg";
  homeFile = ./home.nix;
in {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
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

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;

      prime = {
        # sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
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
  system.stateVersion = "24.05";
}
