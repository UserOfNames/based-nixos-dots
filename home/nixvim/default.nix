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
      vim.o.loaded_netrw = 1
      vim.o.loaded_netrwPlugin = 1
      vim.o.syntax = false
      vim.o.foldlevelstart = 99
      vim.o.number = true
      vim.o.hidden = true
      vim.o.hlsearch = false
      vim.g.mapleader = " "
    '';

    extraPlugins = with pkgs.vimPlugins; [
      vimwiki
      vim-numbertoggle
    ];

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

      telescope = {
        enable = true;
      };

      lualine = {
        enable = true;
      };

      fugitive.enable = true;
      undotree.enable = true;
      nix.enable = true;
      commentary.enable = true;
      vimtex.enable = true;
    };

    keymaps = [
      # General / misc mappings
      { mode = "n"; key = "<Leader>ms"; action = "function() vim.o.spell = not(vim.o.spell) end"; lua = true; }
      { mode = "n"; key = "<Enter>"; action = "o<Esc>"; }
      { mode = "n"; key = "<Leader>u"; action = "vim.cmd.UndoTreeToggle"; }

      # Split mappings
      { mode = "n"; key = "<M-v>"; action = ":vsplit <Enter>"; options.silent = true; }
      { mode = "n"; key = "<M-s>"; action = ":split <Enter>"; options.silent = true; }
      # Navigate splits
      { mode = "n"; key = "<M-k>"; action = "<C-w>k"; }
      { mode = "n"; key = "<M-j>"; action = "<C-w>j"; }
      { mode = "n"; key = "<M-l>"; action = "<C-w>l"; }
      { mode = "n"; key = "<M-h>"; action = "<C-w>h"; }
      # Resize splits
      { mode = "n"; key = "<M-K>"; action = "<C-w>+"; }
      { mode = "n"; key = "<M-J>"; action = "<C-w>-"; }
      { mode = "n"; key = "<M-L>"; action = "<C-w>>"; }
      { mode = "n"; key = "<M-H>"; action = "<C-w><"; }
      # Swap splits
      { mode = "n"; key = "<M-x>"; action = "<C-w>x"; }

      # File / find mappings
      { mode = "n"; key = "<Leader>ff"; action = "require('telescope.builtin').find_files"; lua = true; }
      { mode = "n"; key = "<Leader>fb"; action = "require('telescope.builtin').buffers"; lua = true; }
      { mode = "n"; key = "<Leader>fg"; action = "require('telescope.builtin').git_files"; lua = true; }
      { mode = "n"; key = "<Leader>fs"; action = "require('telescope.builtin').live_grep"; lua = true; }
      { mode = "n"; key = "<Leader>ft"; action = ":e . <Enter>"; options.silent = true; }

      # Terminal mappings
      { mode = "t"; key = "<Esc>"; action = "<C-Bslash><C-n>"; }
      { mode = "n"; key = "<Leader>tt"; action = ":FloatermToggle <Enter>"; options.silent = true; }
      { mode = "t"; key = "<Leader>tt"; action = "<C-Bslash><C-n> :FloatermToggle <Enter>"; options.silent = true; }
      { mode = "n"; key = "<Leader>tn"; action = ":FloatermNew <Enter>"; options.silent = true; }
      { mode = "t"; key = "<Leader>tn"; action = "<C-Bslash><C-n> :FloatermNew <Enter>"; options.silent = true; }
      { mode = "n"; key = "<Leader>th"; action = ":FloatermPrev <Enter>"; options.silent = true; }
      { mode = "t"; key = "<Leader>th"; action = "<C-Bslash><C-n> :FloatermPrev <Enter>"; options.silent = true; }
      { mode = "n"; key = "<Leader>tl"; action = ":FloatermNext <Enter>"; options.silent = true; }
      { mode = "t"; key = "<Leader>tl"; action = "<C-Bslash><C-n> :FloatermNext <Enter>"; options.silent = true; }
    ];
  };
}
