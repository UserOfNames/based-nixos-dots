{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules.nix
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko 
    (import ./disko.nix { device = "/dev/nvme0n1"; })
  ];

  networking.hostName = "nyx";

  environment.systemPackages = with pkgs; [
    prismlauncher
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



  # Set this on install according to the version of NixOS
  # on installation (copy from auto-generated configuration.nix).
  # Do not change once set!
  system.stateVersion = "24.05";
}
