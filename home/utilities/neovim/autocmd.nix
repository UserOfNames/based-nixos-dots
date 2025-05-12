{ ... }:

{
  programs.nixvim.autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "lua" ];

      callback = {
        __raw = ''function()
           vim.opt_local.softtabstop = 3
           vim.opt_local.tabstop = 3
           vim.opt_local.shiftwidth = 3
        end'';
      };
    }

    # {
    #   event = [ "FileType" ];
    #   pattern = [ "markdown" "tex" ];
    #
    #   callback = {
    #     __raw = ''function()
    #        vim.opt_local.spell = true
    #     end'';
    #   };
    # }

    {
      event = [ "FileType" ];
      pattern = [ "nix" ];

      callback = {
        __raw = ''function()
           vim.opt_local.softtabstop = 2
           vim.opt_local.tabstop = 2
           vim.opt_local.shiftwidth = 2
        end'';
      };
    }
  ];
}
