{ myLib, ... }:

let
  ls = ''require("luasnip")'';
in {
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;

        lazyLoad = {
          settings = {
            event = "DeferredUIEnter";
          };
        };
      };

      friendly-snippets.enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkFunctionMap [ "i" "s" ] "<C-n>"
      ''
        if ${ls}.jumpable(1) then
           ${ls}.jump(1)
        elseif ${ls}.choice_active() then
           ${ls}.change_choice(1)
        end
      ''
      "Jump to next point in snippet")

      (mkFunctionMap [ "i" "s" ] "<C-p>"
      ''
        if ${ls}.jumpable(-1) then
           ${ls}.jump(-1)
        elseif ${ls}.choice_active() then
           ${ls}.change_choice(-1)
        end
      ''
      "Jump to previous point in snippet")
    ];
  };
}
