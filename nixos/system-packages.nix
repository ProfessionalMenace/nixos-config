{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    fastfetch
    pkg-config
    neovim
    htop
  # BUILD TOOLS & VERSION CONTROL
    cmake
    gnumake
    git
    ninja
  # C/C++ Toolchain
    clang
    clang-tools
    lldb
    gdb
    valgrind
  # Rust & Zig
    rustup
    zig
 ];
}
