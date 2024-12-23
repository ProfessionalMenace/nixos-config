{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "redacted";
  networking.networkmanager.enable = true;

  # Locales
  time.timeZone = "Europe/Prague";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "cs_CZ.UTF-8";
      LC_IDENTIFICATION = "cs_CZ.UTF-8";
      LC_MEASUREMENT = "cs_CZ.UTF-8";
      LC_MONETARY = "cs_CZ.UTF-8";
      LC_NAME = "cs_CZ.UTF-8";
      LC_NUMERIC = "cs_CZ.UTF-8";
      LC_PAPER = "cs_CZ.UTF-8";
      LC_TELEPHONE = "cs_CZ.UTF-8";
      LC_TIME = "cs_CZ.UTF-8";
    };
  };
  
  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  }; 

  # Install River
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [ 
      foot
      rofi-wayland
      grim
      slurp
    ];
  };

  # WAYBAR
  programs.waybar.enable = true;

  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Steam
  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
  ];
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.redacted = {
    isNormalUser = true;
    description = "REDACTED";
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      aseprite
      discord
      keepassxc
      krita
      qbittorrent
      thunderbird
      ldtk
      obsidian
      github-desktop
      fastfetch
      ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    pkg-config
    neovim
    wl-clipboard
    htop
  # Devel
    cmake
    gnumake
    git
    julia-bin
    lua
    rustup
    zig
  # C
    clang
    clang-tools
    gcc
    gdb
    valgrind
  ];

  # Automatic tasks
  nix.optimise.automatic = true;
  nix.gc.automatic = true;
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  system.stateVersion = "24.05";
}
