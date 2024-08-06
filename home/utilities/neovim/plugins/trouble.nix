{ myLib, ... }:

{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };

    keymaps = with myLib.nixvim; [
      (mkMap [ "n" ] "<Leader>tt" {
        __raw = ''function() vim.cmd.Trouble("diagnostics toggle") end'';
      } "Toggle trouble diagnostics window")
    ];
  };
}
