{ myLib, ... }:

{
  programs.nixvim.plugins.which-key = {
    enable = true;

    settings = {
      delay = { __raw = ''function(ctx) return ctx.plugin and 0 or 1500 end''; };
    };
  };
}
