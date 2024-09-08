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

      performance = {
        byteCompileLua = {
          enable = true;
          configs = true;
          initLua = true;
          nvimRuntime = true;
          plugins = true;
        };

        combinePlugins = {
          enable = true;

          standalonePlugins = [
            "friendly-snippets"
          ];
        };
      };
    };
  };
}
