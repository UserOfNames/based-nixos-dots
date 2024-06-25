{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland.bemenu;
  cfgZsh = config.myHomeModules.system.zsh;
in {
  config = lib.mkIf cfg.enable {
    programs.bemenu = {
      enable = true;
      settings = {
        prompt = ":>";
        fixed-height = true;
        center = true;
        border = 1;
        list = 20;
        ignorecase = true;
        width-factor = 0.3;
        binding = "vim";
        vim-esc-exits = true; 
        single-instance = true;
        # Font
        fn = "JetBrainsMono Nerd Font 12";
        # Title background.
        tb = "#1a1b26";
        # Title foreground.
        tf = "#c0caf5";
        # Filter background.
        fb = "#1a1b26";
        # Filter foreground
        ff = "#c0caf5";
        # Cursor background.
        cb = "#1a1b26";
        # Cursor foreground
        cf = "#c0caf5";
        # Normal background.
        nb = "#1a1b26";
        # Normal foreground.
        nf = "#c0caf5";
        # Highlighted background.
        hb = "#283457";
        # Highlighted foreground.
        hf = "#c0caf5";
        # Feedback background.
        fbb = "#1a1b26";
        # Feedback foreground.
        fbf = "#c0caf5";
        # Selected background.
        sb = "#1a1b26";
        # Selected foreground.
        sf = "#c0caf5";
        # Alternating background color.
        ab = "#1a1b26";
        # Alternating foreground color.
        af = "#c0caf5";
        # Scrollbar background.
        scb = "#1a1b26";
        # Scrollbar foreground.
        scf = "#c0caf5";
        # Border color.
        bdr = "#ffffff";
      };
    };

    programs.zsh.shellAliases = lib.mkIf cfgZsh.enable {
      s = "cd `hash -d | fzf | sed 's/^.*=//'`";
    };
  };
}
