{ ... }:

{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;

    settings = {
      completion = {
        documentation = {
          auto_show = true;
        };
      };

      keymap = {
        preset = "none";

        "<C-j>" = [ "select_next" ];
        "<C-k>" = [ "select_prev" ];
        "<C-l>" = [ "accept" ];
        "<C-e>" = [ "cancel" ];
      };

      sources = {
        default = [ "lsp" "buffer" "snippets" "path" ];
      };

      snippets = {
        preset = "luasnip";
      };
    };
  };
}
