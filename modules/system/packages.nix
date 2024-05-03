{ config, pkgs, ... }:

{
  # Allow unfree software, enable nix command and flakes
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # This is for programs that can only be declared directly.
  environment.systemPackages = with pkgs; [
    btop
    wl-clipboard
    texliveFull
    ripgrep
    alacritty
    lf
    gnupg
    mako
    hyprpaper
    hyprlock
    bemenu
    j4-dmenu-desktop
    fuzzel

    swww
    waypaper
  ];

  # Add nerdfont hack to fonts, mostly for neovim
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
