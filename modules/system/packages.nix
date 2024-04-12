{ config, pkgs, ... }:

{
  # Allow unfree software, enable nix command and flakes
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Programs with programs... options should be given their own modules in the appropriate place.
  # This is for programs that can only be declared directly.
  environment.systemPackages = with pkgs; [
    btop
    mpv
    fastfetch
    wl-clipboard
    texliveFull
    ripgrep
    lf
    gnupg
  ];

  # Add nerdfont hack to fonts, mostly for neovim
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
