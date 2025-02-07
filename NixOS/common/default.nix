{ pkgs, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./audio.nix
      ./bluetooth.nix
      ./desktop.nix
      ./flatpak.nix
      ./gpg.nix
      ./i18n.nix
      ./keymap.nix
      ./network.nix
      ./services.nix
      ./steam.nix
      ./sudoers.nix
      ./toolbox.nix
      ./virtualize.nix
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.upiscium = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "uPiscium";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [ ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
