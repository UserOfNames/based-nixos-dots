{ config, pkgs, ... }:

{
  # Bootloader - systemd-boot, maximum 20 generations
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 20;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      timeout = 10;
      systemd-boot.editor = false;
    };
  };



  # Networking - enable firewall with default policies, use network manager
  networking = {
    firewall = {
      enable = true;
    };

    networkmanager = {
      enable = true;
    };
  };



  # Timezone and locale - American Eastern time, US english
  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Display and DE - Wayland with xwayland, Plasma/SDDM, xkb uses US layout with caps lock mapped to escape
  programs.xwayland.enable = true;
  services = {
    desktopManager.plasma6.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma";
      };

      xkb = {
        layout = "us";
      };
    };
  };
  # Exclude these default plasma packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    khelpcenter
    plasma-browser-integration
    kwalletmanager
    plasma-systemmonitor
  ];



  # Packages - Allow unfree software, enable 'nix' command and flakes, system-wide software
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Programs with no additional system-wide configuration
  environment.systemPackages = with pkgs; [
    btop
    gnupg
    mpv
    firefox
    git
    fastfetch
    wl-clipboard
    texliveMedium
    ripgrep
  ];

  # Programs with additional system-wide confiuration
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  # Add nerdfont hack to fonts, mostly for nvim-tree
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];



  # Hardware settings - enable printing and sound (pipewire w/ alsa, pulse, and wireplumber)
  # Do not use sound.enable as it is only meant for ALSA
  services.printing.enable = true;

  #rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    #jack.enable = true;
  };



  # Store optimization - Automatically optimize and collect garbage once per week
  nix = {
    optimise = {
      automatic = true;
      dates = [
        "weekly"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };



  # Services - Additional services
  services = {
    fail2ban = {
      enable = true;
      bantime = "4000";
    };
  };



  # Security - sudo configuration (show password feedback)
  security = {
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
      '';
    };
  };
}
