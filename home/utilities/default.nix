{ lib, ... }:

let dtrue = lib.mkDefault true; in {
  imports = [
    ./lf
    ./neovim
    ./btop.nix
    ./firefox.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./tmux.nix
    ./xremap.nix
    ./zathura.nix
  ];

  myHomeModules = {
    lf.enable = dtrue;
    neovim.enable = dtrue;
    btop.enable = dtrue;
    firefox.enable = dtrue;
    foot.enable = dtrue;
    fuzzel.enable = dtrue;
    git.enable = dtrue;
    tmux.enable = dtrue;
    xremap.enable = dtrue;
    zathura.enable = dtrue;
  };
}
