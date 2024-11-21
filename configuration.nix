{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "redacted";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

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
  
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Install Hyprland
  programs.river.enable = true;

  # Install Waybar
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
      github-desktop
      keepassxc
      krita
      qbittorrent
      thunderbird
      ldtk
      obsidian
      ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    pkg-config
    neovim
    wl-clipboard
    htop
  # BUILD TOOLS & VERSION CONTROL
    cmake
    gnumake
    git
  # LANGUAGES & COMPILERS
    clang
    clang-tools
    gcc
    julia-bin
    lua
    rustup
    valgrind
    zig
  ];

  # Automatic nix-store --optimise
  nix.optimise.automatic = true;
  nix.gc.automatic = true;
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  system.stateVersion = "24.05";
}
