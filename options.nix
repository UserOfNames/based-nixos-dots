{ config, pkgs, lib, ... }:

let
  mke = lib.mkEnableOption;
  lmd = lib.mkDefault;
  cfg = config.myModules;
  hfg = config.myHomeModules;
  sfg = config.scripts;

  mo = lmd cfg.other.enable;
  ms = lmd cfg.system.enable;
  mu = lmd cfg.utilities.enable;

  ho = lmd hfg.other.enable;
  hp = lmd hfg.productivity.enable;
  hs = lmd hfg.system.enable;
  hu = lmd hfg.utilities.enable;

  se = lmd sfg.enable;
in {
  /* Options for all modules are declared here. I did it this way to allow
  sharing options between home and system modules when necessary and to provide
  a centralized location to browse module options.*/
  options = {
    myModules = {
      other = {
        enable = mke "Enable 'other' NixOS module group";
        gaming.enable = mke "Enable gaming module";
        stylix.enable = mke "Enable stylix";
      };

      system = {
        enable = mke "Enable 'system' NixOS module group";
        bootloader = {
          enable = mke "Enable bootloader module";
          useLatestKernel = mke "Use the latest kernel";
        };

        display = {
          enable = mke "Enable basic display settings";
          hyprland.enable = mke "Enable basic hyprland (configuration is a home module)";
          plasma.enable = mke "Enable KDE plasma module";
          sddm.enable = mke "Enable SDDM module";
        };

        hardware = {
          enable = mke "Enable hardware module";
          bluetooth.enable = mke "Enable bluetooth";
          laptop.enable = mke "Enable some settings for laptops";
          printing.enable = mke "Enable printing";
          sound.enable = mke "Enable sound";
        };

        user = {
          enable = mke "Enable main user module";
          userName = lib.mkOption {
            default = "zdbg";
            description = "Main user username";
          };
        };

        locale.enable = mke "Enable locale module";
        network.enable = mke "Enable network module";
        packages.enable = mke "Enable packages module";
        security.enable = mke "Enable security module";
        store.enable = mke "Enable nix store module";
        zsh.enable = mke "Enable zsh";
      };

      utilities = {
        enable = mke "Enable 'utilities' NixOS module group";
        thunar.enable = mke "Enable thunar";
        virtualization.enable = mke "Enable virtualization";
      };
    };

    myHomeModules = {
      other = {
        enable = mke "Enable 'other' home module group";
        fastfetch.enable = mke "Enable fastfetch";
        newsboat.enable = mke "Enable newsboat";
        ytdlp.enable = mke "Enable YT-DLP";
      };

      productivity = {
        enable = mke "Enable 'productivity' home module group";
      };

      system = {
        enable = mke "Enable 'system' home module group";
        hyprland = {
          enable = mke "Enable hyprland";
          bemenu.enable = mke "Enable bemenu";
          hypridle.enable = mke "Enable hypridle";
          hyprlock.enable = mke "Enable hyprlock";
          mako.enable = mke "Enable mako";
          waybar.enable = mke "Enable waybar";
        };
        zsh.enable = mke "Enable zsh";
      };

      utilities = {
        enable = mke "Enable 'utilities' home module group";
        btop.enable = mke "Enable btop";
        firefox.enable = mke "Enable firefox";
        fzf.enable = mke "Enable fzf";
        git.enable = mke "Enable git";
        kitty.enable = mke "Enable kitty";
        mpd.enable = mke "Enable mpd";
        mpv.enable = mke "Enable mpv";
        ncmpcpp.enable = mke "Enable ncmpcpp";
        neovim.enable = mke "Enable neovim";
        syncthing.enable = mke "Enable syncthing user service";
        tmux.enable = mke "Enable tmux";
        yazi.enable = mke "Enable yazi";
        zathura.enable = mke "Enable zathura";
      };
    };

    scripts = {
      enable = mke "Enable scripts";
      fzf-cd-common.enable = mke "Enable script to fzf + cd over important directories";
      tmux-sessionizer.enable = mke "Enable tmux-sessionizer script by Primeagen";
    };
  };



  config = {
    myModules = {
      other = {
        gaming.enable = mo;
        stylix.enable = mo;
      };

      system = {
        bootloader = {
          enable = ms;
          useLatestKernel = lmd cfg.system.bootloader.enable;
        };

        display = {
          enable = ms;
          hyprland.enable = lmd cfg.system.display.enable;
          # plasma.enable = lmd cfg.system.display.enable;
          sddm.enable = lmd cfg.system.display.enable;
        };

        hardware = {
          enable = ms;
          # bluetooth.enable = lmd cfg.system.hardware.enable;
          # laptop.enable = lmd cfg.system.hardware.enable;
          printing.enable = lmd cfg.system.hardware.enable;
          sound.enable = lmd cfg.system.hardware.enable;
        };

        user.enable = ms;

        locale.enable = ms;
        network.enable = ms;
        packages.enable = ms;
        security.enable = ms;
        store.enable = ms;
        zsh.enable = ms;
      };

      utilities = {
        # thunar.enable = mu;
        # virtualization.enable = mu;
      };
    };

    myHomeModules = {
      other = {
        fastfetch.enable = ho;
        newsboat.enable = ho;
        ytdlp.enable = ho;
      };

      productivity = {
      };

      system = {
        hyprland = {
          enable = hs;
          bemenu.enable = lmd hfg.system.hyprland.enable;
          hypridle.enable = lmd hfg.system.hyprland.enable;
          hyprlock.enable = lmd hfg.system.hyprland.enable;
          mako.enable = lmd hfg.system.hyprland.enable;
          waybar.enable = lmd hfg.system.hyprland.enable;
        };
        zsh.enable = hs;
      };

      utilities = {
        btop.enable = hu;
        firefox.enable = hu;
        fzf.enable = hu;
        git.enable = hu;
        kitty.enable = hu;
        mpd.enable = hu;
        mpv.enable = hu;
        ncmpcpp.enable = hu;
        neovim.enable = hu;
        syncthing.enable = hu;
        tmux.enable = hu;
        yazi.enable = hu;
        zathura.enable = hu;
      };
    };

    scripts = {
      enable = lmd true;
      fzf-cd-common.enable = se;
      tmux-sessionizer.enable = se;
    };
  };
}
