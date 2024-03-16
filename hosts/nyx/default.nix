{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common
  ];

  # Set hostname for this machine
  networking.hostName = "nyx";



  # User settings
  users.users.zdbg = {
    isNormalUser = true;
    description = "zdbg";
    extraGroups = [ "networkmanager" "wheel" ];
  };



  # Package settings
  environment.systemPackages = with pkgs; [
  # Declare system-wide packages with no system-wide config for the unstable branch
    tor-browser-bundle-bin
  ];

  # Programs with extra configuration for specific machine
  programs = {
    steam = {
      enable = true;
    };
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
