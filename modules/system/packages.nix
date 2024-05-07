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
    _7zz
    btop
    cliphist
    foot
    fuzzel
    gnupg
    hypridle
    hyprlock
    lf
    mako
    ripgrep
    texliveFull
    tree
    wl-clip-persist
    wl-clipboard
  ];

  # Add nerdfont hack to fonts, mostly for neovim
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
