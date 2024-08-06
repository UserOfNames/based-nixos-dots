{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.myHomeModules.utilities.neovim;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./autocmd.nix
    ./mappings.nix
    ./options.nix
  ];
  
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
