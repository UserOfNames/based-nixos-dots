{ config, lib, inputs, myLib, ... }:

let
  cfg = config.myHomeModules.utilities.neovim;
in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ] ++ (myLib.importHelper ./.);
  
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
