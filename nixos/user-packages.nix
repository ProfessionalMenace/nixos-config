{ pkgs, ...}:
{
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      gimp3
      git
      fastfetch
      keepassxc
      thunderbird
      olympus
      unzip
      vesktop
      vscodium
      kdePackages.okular
      zathura

      neovim
      nixd
      elan # awful 
      texliveMedium
    ];
  };
}
