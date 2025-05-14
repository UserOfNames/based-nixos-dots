{ myLib, ... }:

{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;

      lazyLoad = {
        settings = {
          cmd = "Trouble";
        };
      };
    };

    keymaps = with myLib.nixvim; [
      (mkFunctionMap [ "n" ] "<Leader>tt" ''vim.cmd.Trouble("diagnostics toggle")'' "Toggle trouble diagnostics window")
    ];
  };
}
