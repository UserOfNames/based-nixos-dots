{ pkgs, inputs, myLib, ... }:

let
  userName = "zdbg";
  homeFile = ./home.nix;
  diskoDevice = "/dev/nvme0n1";
  dotsPath = "/home/${userName}/.nixosdots";
in {
  imports = [
    ./hardware-configuration.nix
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.wooting.enable = true;

  # services.ollama = {
  #   enable = true;
  #   acceleration = "rocm";
  # };

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
      };

      display = {
        plasma.enable = true;
      };
    };

    utilities = {
      enable = true;
      virtualization.enable = true;
      wireshark.enable = true;
    };
  };



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "24.05";
}
