{ pkgs, ...}:
{
  users.users.REDACTED = {
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
