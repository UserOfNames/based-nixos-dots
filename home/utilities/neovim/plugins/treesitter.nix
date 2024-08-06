{ ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    folding = true;

    settings = {
      auto_install = false;

      ignore_install = [
        "latex"
      ];

      indent = {
        enable = true;
      };

      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
        disable = [ 
          "latex"
        ];
      };
    };
  };
}
