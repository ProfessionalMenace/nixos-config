{ pkgs, ...}:
{
  users.users.adamv = {
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
}
