{ ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        icons_enabled = true;
      };
    };

    lazyLoad = {
      settings = {
        event = "DeferredUIEnter";
      };
    };
  };
}
