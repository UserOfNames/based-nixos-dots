{ config, pkgs, lib, ... }:

{
  options = {
    myModules.packages.enable = lib.mkEnableOption "Enable packages module";
  };

  config = lib.mkIf config.myModules.packages.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Before adding a package here, make sure there isn't a module for it
    # Packages only useful for certain machines should be declared in the
    # relevant host file, not here. These packages are shared between all hosts.
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
      tree
      wl-clip-persist
      wl-clipboard

      # Here are packages configured via home-manager, but also
      # installed system-wide with no further configuration.
      firefox
      git
      neovim
      tmux
    ];
  };
}
