# Configurations for all machines

{ config, pkgs, ... }:

{

  # Bootloader
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



  # Networking
  networking = {
    firewall = {
      enable = true;
    };

    networkmanager = {
      enable = true;
    };

    # wireless = {
    #   enable = true;
    # };
  };



  # Timezone, locale
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

  # Display and DE settings
  programs.xwayland.enable = true;
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "plasma";
    desktopManager.plasma6.enable = true;
    xkb = {
      layout = "us";
      variant = "";
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



  # Package settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    btop
    gnupg
    mpv
    firefox
    git
    fastfetch
    wl-clipboard
    texliveMedium
  ];




  # Hardware settings
  # Enable printing
  services.printing.enable = true;

  # Enable sound with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    #jack.enable = true;
  };



  # Programs for all machines
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  # Add nerdfont hack to fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  # Store optimization
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



  # Services
  services = {
    fail2ban = {
      enable = true;
      bantime = "4000";
    };
  };



  # Security
  security = {
  };



  # Zsh options
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];

}
