{ ... }:

{
  programs.nixvim.plugins.rustaceanvim = {
    enable = true;

    settings = {
      tools = {
        hover_actions.replace_builtin_hover = true;
      };
    };
  };
}
