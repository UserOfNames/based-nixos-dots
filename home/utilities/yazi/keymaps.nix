{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.utilities.yazi;
in {
  config = lib.mkIf cfg.enable {
    programs.yazi.keymap = {
      manager = {
        prepend_keymap = [
          { on = [ "<C-l>" ]; run = "open"; desc = "Open the selected files"; }
          { on = [ "<C-L>" ]; run = "open --interactive"; desc = "Open the selected files interactively"; }

          { on = [ "`" ]; run = "shell '${pkgs.ripdrag}/bin/ripdrag -a -x \"$@\"' --confirm"; desc = "Ripdrag the selected files"; }
        ];
      };

      tasks = {
        prepend_keymap = [
          { on = [ "<C-l>" ]; run = "inspect"; desc = "Inspect the task"; }
        ];
      };

      select = {
        prepend_keymap = [
          { on = [ "<C-l>" ]; run = "close --submit"; desc = "Submit the selection"; }
        ];
      };

      input = {
        prepend_keymap = [
          { on = [ "<C-l>" ]; run = "close --submit"; desc = "Submit the input"; }
        ];
      };

      completion = {
        prepend_keymap = [
          { on = [ "<C-l>" ]; run = [ "close --submit" "close_input --submit" ]; desc = "Submit the completion and input"; }
        ];
      };

      # help = {
      # };
    };
  };
}
