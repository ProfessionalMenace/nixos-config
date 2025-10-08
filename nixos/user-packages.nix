{ pkgs, ...}:
{
  users.users.REDACTED = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      gimp3
      github-desktop
      fastfetch
      keepassxc
      lean4
      thunderbird
      typst
      tinymist
      olympus
      vesktop
      vscodium
    ];
  };
}
