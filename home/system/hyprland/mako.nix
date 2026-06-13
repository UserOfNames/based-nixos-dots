{ myLib, ... }:

{
  config.services.mako = {
    enable = true;

    settings = with myLib.base16Scheme; {
      default-timeout = 10000;

      background-color = "#${base00}";
      border-color = "#${base0D}";

      font = "monospace 10";

      border-radius = 1;
    };
  };
}
