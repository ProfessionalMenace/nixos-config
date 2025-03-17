{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
  # 1
    ghostty
    yazi
    fastfetch
    grim
    slurp
    waybar
    polkit_gnome
    rofi-wayland
  # 2
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
