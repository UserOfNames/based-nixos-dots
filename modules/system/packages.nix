{ config, pkgs, ... }:

{
  # Allow unfree software, enable 'nix' command and flakes, system-wide software
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Programs with no additional system-wide configuration
  environment.systemPackages = with pkgs; [
    btop
    gnupg
    mpv
    firefox
    fastfetch
    wl-clipboard
    texliveMedium
    ripgrep
  ];

  # # Programs with additional system-wide confiuration
  # programs = {
  #   neovim = {
  #     enable = true;
  #     defaultEditor = true;
  #   };
  # };

  # Add nerdfont hack to fonts, mostly for nvim-tree
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
