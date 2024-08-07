{ ... }:

let
  cmp = ''require("cmp")'';
  cmp_select = "{ behavior = cmp.SelectBehavior.Select }";
in {
  programs.nixvim.plugins.cmp = {
    enable = true;

    settings = {
      preselect = "item";

      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "luasnip"; }
        { name = "buffer"; }
      ];

      mapping = {
        "<C-j>" = "${cmp}.mapping.select_next_item(${cmp_select})";
        "<C-k>" = "${cmp}.mapping.select_prev_item(${cmp_select})";
        "<C-l>" = "${cmp}.mapping.confirm({ select = true })";
        "<C-e>" = "${cmp}.mapping.abort()";
      };

      snippet = {
        expand = ''function(args) require("luasnip").lsp_expand(args.body) end'';
      };
    };
  };
}
