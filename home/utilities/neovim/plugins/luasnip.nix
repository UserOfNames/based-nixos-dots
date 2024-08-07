{ myLib, ... }:

let
  ls = ''require("luasnip")'';
in {
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
      };

      friendly-snippets.enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "i" "s" ] "<C-n>" {
        __raw = ''function()
           if ${ls}.jumpable(1) then
              ${ls}.jump(1)
           elseif ${ls}.choice_active() then
              ${ls}.change_choice(1)
           end
        end'';
      } "Jump to next point in snippet")

      (mkMap [ "i" "s" ] "<C-p>" {
        __raw = ''function()
           if ${ls}.jumpable(-1) then
              ${ls}.jump(-1)
           elseif ${ls}.choice_active() then
              ${ls}.change_choice(-1)
           end
        end'';
      } "Jump to previous point in snippet")
    ];
  };
}
