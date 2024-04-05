{ config, pkgs, ...}:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.base16 = {
      enable = true;
      colorscheme = "tomorrow-night";
    };

    extraConfigLuaPre = ''
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      syntax = false;
      number = true;
      hidden = true;
      hlsearch = false;
    '';

    plugins = {
      treesitter = {
        enable = true;
	folding = true;
	indent = true;
      };

      oil = {
      	enable = true;
	settings.view_options.show_hidden = true;
      };

      floaterm = {
        enable = true;
      };

      nix.enable = true;
    };

    keymaps = [
      { mode = "n"; key = "<M-v>"; action = ":vsplit <Enter>"; options.silent = true; }
      { mode = "n"; key = "<M-s>"; action = ":split <Enter>"; options.silent = true; }
    ];
  };
}
