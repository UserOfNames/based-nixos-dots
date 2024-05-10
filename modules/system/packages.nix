{ config, pkgs, lib, ... }:

{
  options = {
    module-packages.enable = lib.mkEnableOption "Enable packages module";
  };

  config = lib.mkIf config.module-packages.enable {
    # Allow unfree software, enable nix command and flakes
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Packages only useful for certain machines should be
    # declared in the relevant host file, not here.
    environment.systemPackages = with pkgs; [
      # This is for programs that can only be declared directly.
      # Before adding a package here, make sure there isn't a module for it
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
      tree
      wl-clip-persist
      wl-clipboard

      # Here are packages configured via home-manager,
      # but installed system-wide as well.
      firefox
      git
      neovim
      tmux
    ];

    # Add nerdfont hack to fonts, mostly for neovim
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
