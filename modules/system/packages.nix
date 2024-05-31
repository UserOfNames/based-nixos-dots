{ config, pkgs, lib, ... }:

let
  cfg = config.myModules.system.packages;
in {
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Before adding a package here, make sure there isn't a module for it
    # These packages are shared between all hosts. Packages only useful for
    # certain machines should be declared in the relevant host file, not here.
    environment.systemPackages = with pkgs; [
      _7zz
      cliphist
      gnupg
      jmtpfs
      ripgrep
      tree
      wl-clip-persist
      wl-clipboard
      wlr-randr

      # Here are packages configured via home-manager, but also
      # installed system-wide with no further configuration.
      bemenu
      btop
      firefox
      # foot
      git
      j4-dmenu-desktop
      kitty
      lf
      mako
      neovim
      tmux
    ];
  };
}
