{ pkgs, ...}:
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    foot
    grim
    slurp
    waybar
    polkit_gnome
    kitty
    rofi-wayland
    pkg-config
    neovim
    wl-clipboard
    htop
  # BUILD TOOLS & VERSION CONTROL
    cmake
    gnumake
    git
    meson
    ninja
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
}
