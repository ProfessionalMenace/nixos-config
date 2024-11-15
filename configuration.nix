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
      vscodium
      obsidian
      ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    pkg-config
    neovim
    wl-clipboard
  # BUILD TOOLS & VERSION CONTROL
    cmake
    gnumake
    git
  # LANGUAGES & COMPILERS
    clang
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
