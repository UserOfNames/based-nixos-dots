{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system.hyprland;
  swww-random = pkgs.writeShellScriptBin "swww-random" ''
    sleep 1
    if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
      echo "Usage:
      $0 <path/to/wallpapers/folder>"
      exit 1
    fi

    # Edit below to control the images transition
    export SWWW_TRANSITION_FPS=60
    export SWWW_TRANSITION_STEP=2

    # This controls (in seconds) when to switch to the next image
    INTERVAL=300

    while true; do
      find "$1" -type f \
        | while read -r img; do
          echo "$((RANDOM % 1000)):$img"
        done \
        | sort -n | cut -d':' -f2- \
        | while read -r img; do
          swww img "$img"
          sleep $INTERVAL
        done
    done
  '';
in {
  imports = [
    ./waybar
    ./bemenu.nix
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./mako.nix
  ];
  
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      cliphist
      grim
      hyprpicker
      j4-dmenu-desktop
      slurp
      swww
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$terminal" = "kitty";
        "$browser" = "firefox";
        "$editor" = "$terminal -e nvim";
        "$fileManager" = "$terminal -e yazi";
        "$dmenu" = "bemenu";
        "$launcher" = "j4-dmenu-desktop --dmenu=$dmenu --term $terminal --no-generic";

        exec-once = [
          "swww-daemon"
          "${swww-random}/bin/swww-random /home/${config.myModules.system.user.userName}/Wallpapers"
          "hypridle"
          "mako"
          "${pkgs.networkmanagerapplet}/bin/nm-applet"
          "wl-clip-persist --clipboard regular"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        general = {
          "border_size" = 2;
          "gaps_in" = 5;
          "gaps_out" = 10;
          "layout" = "master";
          "col.active_border" = lib.mkForce "0xffffffff";
        };

        decoration = {
          "rounding" = 5;
          "active_opacity" = 0.95;
          "inactive_opacity" = 0.85;
          "blur" = {
            "enabled" = false;
          };
        };

        animations = {
          enabled = true;
          first_launch_animation = false;

          animation = [
            "windows, 1, 7, default"
            "fade, 0"
            "workspaces, 1, 3, default, fade"
          ];
        };

        input = {
          "numlock_by_default" = lib.mkDefault true;
          "repeat_rate" = 40;
          "repeat_delay" = 300;
          "follow_mouse" = 2;
          "kb_options" = "caps:escape";
          touchpad = {
            "natural_scroll" = false;
          };
        };

        group = {
          groupbar = {
          };
        };

        misc = {
          "force_default_wallpaper" = 1;
          "disable_hyprland_logo" = true;
          "disable_autoreload" = true;
          "enable_swallow" = true;
          "swallow_regex" = "^(kitty)$";
        };

        cursor = {
          "no_warps" = true;
        };

        master = {
          "new_is_master" = false;
        };

        windowrule = [
          "opaque, ^(qimgv)$"
          "opaque, ^(org.pwmt.zathura)$"
        ];

        layerrule = [
          "noanim, ^(menu)$"
        ];
      };
    };
  };
}
