{ config, lib, ... }:

let
  cfg = config.myHomeModules.system.fish;
in {
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        fish_vi_key_bindings
        set fish_greeting
      '';

      shellAliases = {
        ls = "ls -a --color";
        c = "clear";
        clearall = "clear && history clear";
      };

      functions = {
        fish_prompt = {
          body = ''
            set -l root_indicator
            if fish_is_root_user
              set root_indicator '#'
            else
              set root_indicator '%'
            end

            echo -n -s \
              (set_color magenta) \
              "[" \
              (prompt_login) \
              " " \
              (set_color magenta) \
              (prompt_pwd --full-length-dirs 1) \
              "]" \
              $root_indicator \
              (set_color --reset) \
              " "
          '';
        };
      };

      binds = {
        "alt-a" = {
          command = "commandline -r '\ nix develop -c fish'; commandline -f execute";
          mode = "insert";
        };

        "ctrl-z" = {
          command = "fg 2>/dev/null; commandline -f repaint";
          mode = "insert";
        };
      };
    };
  };
}
