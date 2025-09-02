{ config, lib, myLib, ... }:

let
  cfg = config.myHomeModules.utilities.btop;
in {
  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "mine";
        vim_keys = true;
      };

      themes = with myLib.base16Scheme; {
        mine = ''
          theme[main_bg]="#${base00}"
          theme[main_fg]="#${base05}"
          theme[title]="#${base05}"
          theme[hi_fg]="#${base0D}"
          theme[selected_bg]="#${base03}"
          theme[selected_fg]="#${base0D}"
          theme[inactive_fg]="#${base04}"
          theme[graph_text]="#${base06}"
          theme[meter_bg]="#${base03}"
          theme[proc_misc]="#${base06}"
          theme[cpu_box]="#${base0E}"
          theme[mem_box]="#${base0B}"
          theme[net_box]="#${base0C}"
          theme[proc_box]="#${base0D}"
          theme[div_line]="#${base01}"
          theme[temp_start]="#${base0B}"
          theme[temp_mid]="#${base04}"
          theme[temp_end]="#${base08}"
          theme[cpu_start]="#${base0B}"
          theme[cpu_mid]="#${base04}"
          theme[cpu_end]="#${base08}"
          theme[free_start]="#${base04}"
          theme[free_mid]="#${base0B}"
          theme[free_end]="#${base0B}"
          theme[cached_start]="#${base0C}"
          theme[cached_mid]="#${base0C}"
          theme[cached_end]="#${base04}"
          theme[available_start]="#${base08}"
          theme[available_mid]="#${base04}"
          theme[available_end]="#${base0B}"
          theme[used_start]="#${base04}"
          theme[used_mid]="#${base09}"
          theme[used_end]="#${base08}"
          theme[download_start]="#${base0B}"
          theme[download_mid]="#${base04}"
          theme[download_end]="#${base08}"
          theme[upload_start]="#${base0B}"
          theme[upload_mid]="#${base04}"
          theme[upload_end]="#${base08}"
          theme[process_start]="#${base0B}"
          theme[process_mid]="#${base04}"
          theme[process_end]="#${base08}"
        '';
      };
    };
  };
}
