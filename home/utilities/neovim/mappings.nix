{ myLib, ... }:

{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>os" {
        __raw = ''function() vim.o.spell = not(vim.o.spell) end'';
      } "Toggle spellcheck")

      (mkMap [ "n" ] "<Leader>ow" {
        __raw = ''function() vim.o.wrap = not(vim.o.wrap) end'';
      } "Toggle word wrap")

      (mkMap [ "i" ] "<C-s>" "<C-g>u<Esc>[s1z=`]a<C-g>u" "Correct last spelling error")

      (mkMap [ "n" "i" "c" ] "<C-l>" "<Enter>" null)

      # Splits are handled with alt
      (mkMap [ "n" ] "<M-v>" "<cmd>vsplit<Enter>" "Create vsplit")
      (mkMap [ "n" ] "<M-s>" "<cmd>split<Enter>" "Create hsplit")
      (mkMap [ "n" ] "<M-k>" "<C-w>k" "Move to lower split")
      (mkMap [ "n" ] "<M-j>" "<C-w>j" "Move to upper split")
      (mkMap [ "n" ] "<M-l>" "<C-w>l" "Move to right split")
      (mkMap [ "n" ] "<M-h>" "<C-w>h" "Move to left split")
      (mkMap [ "n" ] "<M-K>" "<C-w>+" "Increase split size vertically")
      (mkMap [ "n" ] "<M-J>" "<C-w>-" "Decrease split size vertically")
      (mkMap [ "n" ] "<M-L>" "<C-w>>" "Increase split size horizontally")
      (mkMap [ "n" ] "<M-H>" "<C-w><" "Decrease split size horizontally")
      (mkMap [ "n" ] "<M-x>" "<C-w>x" "Swap splits")
    ];
  };
}
