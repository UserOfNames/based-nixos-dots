{ ... }:

{
  programs.nixvim.plugins.mini = {
    enable = true;
    
    modules = {
      move = {
        mappings = {
          left = "H";
          right = "L";
          down = "J";
          up = "K";

          line_left = "";
          line_right = "";
          line_down = "";
          line_up = "";
        };
      };

      surround = {};
    };

    lazyLoad = {
      settings = {
        event = "DeferredUIEnter";
      };
    };
  };
}
