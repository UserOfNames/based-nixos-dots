{ myLib, ... }:

{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;

      settings = {
        insert_mappings = false;
        open_mapping = "[[<Leader>ot]]";
        direction = "vertical";
        size = ''function() return vim.o.columns * 0.3 end'';
      };
    };
  };
}
