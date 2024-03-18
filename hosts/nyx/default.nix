{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common
  ];

  # Networking - Set hostname and enable wireless
  networking = {
    hostName = "nyx";

    # wireless = {
    #   enable = true;
    # }
  };



  # User - zdbg, wheel group
  users.users.zdbg = {
    isNormalUser = true;
    description = "zdbg";
    extraGroups = [ "networkmanager" "wheel" ];
  };



  # Declare packages with no extra configuration
  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];

  # Programs with extra configuration
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
