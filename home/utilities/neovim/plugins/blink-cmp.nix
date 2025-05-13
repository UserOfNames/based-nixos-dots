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
        "<C-y>" = [ "show_signature" "hide_signature" ];
      };

      signature = {
        enabled = true;

        trigger = {
          show_on_insert = false;
          show_on_trigger_character = false;
          show_on_insert_on_trigger_character = false;
        };
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
