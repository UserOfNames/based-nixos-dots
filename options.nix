{ config, pkgs, lib, ... }:

let
  mke = lib.mkEnableOption;
in {
  /* Options for all modules are declared here. I did it this way to allow
  sharing options between home and system modules when necessary and to provide
  a centralized location to browse module options. This file must be imported
  in each group default.nix file.*/
  options = {
    myModules = {
      other = {
        enable = mke "Enable 'other' NixOS module group";
        gaming.enable = mke "Enable gaming module";
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

        fonts.enable = mke "Enable font module";
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
          cursor.enable = mke "Enable cursor";
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
  };
}
