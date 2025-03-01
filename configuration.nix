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
  
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Desktop environment
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Steam
  programs.steam.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.redacted = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      github-desktop
      imhex
      keepassxc
      thunderbird
      obsidian
      fastfetch
      vesktop
      vscodium
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
  # C and C++
    clang
    clang-tools
    gcc
    gdb
    valgrind
  # Other
    ghc
    julia-bin
    lua
    R
    rustup
    zig
  ];

  # Automation
  nix.optimise.automatic = true;
  nix.gc.automatic = true;
  system.stateVersion = "24.05";
}
