 { config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
    ];

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      timeout = 10;
      systemd-boot.editor = false;
    };
  };



  # Networking
  networking.hostName = "nyx";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.



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
    displayManager.defaultSession = "plasmawayland";
    desktopManager.plasma5.enable = true;
    layout = "us";
    xkbVariant = "";
  };
  
  # Exclude these default plasma packages
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    khelpcenter
    plasma-browser-integration
    kwalletmanager
    plasma-systemmonitor
  ];




  # Hardware settings
  # Enable printing
  services.printing.enable = true;

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    # This is unnecessary for now
    #media-session.enable = true;
  };



  # User settings
  users.users.zdbg = {
    isNormalUser = true;
    description = "zdbg";
    extraGroups = [ "networkmanager" "wheel" ];
  };



  # Package settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
  # Declare system-wide packages with no system-wide config
    btop
    gnupg
    wl-clipboard
    nerdfonts
    steam
    mpv
    firefox
    neovim
    git
  ];



  # Services:
  services = {
    fail2ban = {
      enable = true;
      bantime = 4000;
    };
  };



  # Security:
  security = {
  };



  # Zsh options
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
