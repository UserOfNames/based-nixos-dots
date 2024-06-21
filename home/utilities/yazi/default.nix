{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.yazi;
in {
  imports = [
    ./keymaps.nix
  ];

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        manager = {
          ratio = [ 1 3 5 ];
          sort_by = "natural";
          show_hidden = true;
          scrolloff = 8;
        };

        preview = {
          max_width = 9999;
          max_height = 9999;
        };

        opener = {
          epub = [
            { run = ''foliate "$@"''; orphan = true; }
          ];
        };

        open = {
          prepend_rules = [
            { name = ''*.epub''; use = ''epub''; }
          ];
        };
      };
    };
  };
}
