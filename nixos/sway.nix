{ config, pkgs, lib, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      brightnessctl
      networkmanagerapplet
      ghostty
      grim
      slurp
      pulseaudio
      polkit_gnome
      swayidle
      swaylock
      rofi
      wl-clipboard
      waybar
      ];
  };

  # XDG Portals
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  
  services.gnome.gnome-keyring.enable = true;
  
  services.greetd = {
    enable = true;
    settings = rec {
    initial_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'dbus-run-session sway'";
      user = "REDACTED";
      };
    default_session = initial_session;
    };
  };
}
