{ pkgs, ...}:
{
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      gimp3
      git
      keepassxc
      thunderbird
      olympus # celeste
      unzip
      vesktop
      vscodium
      kdePackages.okular # document viewer
      zathura # document viewer

      neovim
      nixd # nix language server
      elan # lean version manager
      texliveMedium # tex packages
    ];
  };
}
