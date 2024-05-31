{ config, pkgs, lib, ... }:

let
  cfg = config.myHomeModules.system.waybar;
in {
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = ./style.css;
      settings = {
        mainBar = {
          mode = "dock";
          layer = "top";
          position = "top";
          height = 30;
          spacing = 5;

          modules-left = [
            "custom/nixicon"
            "hyprland/workspaces"
            "hyprland/window"
          ];

          modules-right = [
            "mpd"
            "bluetooth"
            "wireplumber"
            "group/hardware"
            "network"
            "clock"
            "tray"
          ];

          "custom/nixicon" = {
            format = "  ";
          };

          "hyprland/workspaces" = {
            # Defaults are good here
          };

          "hyprland/window" = {
            # Defaults are good here
          };

          "backlight" = {
            format = "{percent}% {icon}";
            format-icons = ["" "" "" "" "" "" "" "" ""];
          };

          "battery" = {
            states = { "good" = 95; "warning" = 30; "critical" = 15; };
            format = "{capacity}% {icon}";
             format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
          };

          "bluetooth" = {
            format = "";
            format-connected = "{num_connections} ";
            format-disabled = "";
            tooltip-format = "{device_alias} ";
            tooltip-format-connected = "{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias} ";
          };

          "clock" = {
            format = "{:%H:%M}";
            tooltip-format = "{calendar}";
            actions = {
              on-click-right = "shift_reset";
              on-scroll-down = "shift_down";
              on-scroll-up = "shift_up";
            };

            calendar = {
              weeks-pos = "right";
              format = {
                days = "<span color='#c0caf5'><b>{}</b></span>";
                months = "<span color='#eeeeee'><b>{}</b></span>";
                today = "<span color='#9ece6a'><b><u>{}</u></b></span>";
                weekdays = "<span color='#e0af68'><b>{}</b></span>";
                weeks = "<span color='#7dcfff'><b>W{}</b></span>";
              };
            };
          };

          "cpu" = {
            format = "{usage}% ";
            tooltip = true;
          };

          "group/hardware" = {
            orientation = "inherit";
            drawer = {
              transtion-duration = 500;
            };
            modules = [
              "battery"
              "cpu"
              "memory"
              "temperature"
              "backlight"
            ];
          };

          "memory" = {
            format = "{percentage}% ";
            tooltip = true;
            tooltip-format = "{used:0.1f}GB/{total:0.1f}GB";
          };

          "mpd" = {
            format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon} {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
            format-disconnected = "Disconnected ";
            format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon} Stopped ";
            unknown-tag = "N/A";
            interval = 5;
            consume-icons = {
                on = " ";
            };
            random-icons = {
                on = " ";
            };
            repeat-icons = {
                on = " ";
            };
            single-icons = {
                on = "1 ";
            };
            state-icons = {
                paused = "";
                playing = "";
            };

            tooltip-format = "MPD (connected)";
            tooltip-format-disconnected = "MPD (disconnected)";
          };

          "network" = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr}";
            tooltip-format = "{ifname} via {gwaddr}";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };

          "temperature" = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-critical = "{temperatureC}°C {icon}";
            format-icons = ["" "" ""];
          };

          "tray" = {
            icon-size = 15;
            spacing = 6;
          };

          "wireplumber" = {
            format = "{volume}% {icon}";
            format-icons = ["" "" ""];
            format-muted = "";
            on-click = "helvum";
          };
        };
      };
    };
  };
}
