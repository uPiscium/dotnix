{ ... }: {
  imports = [
    ./browser.nix
    ./gtk.nix
    ./hyprland.nix
    ./nas.nix
    ./packages.nix
  ];

  # home = rec {
  #   username = "upiscium";
  #   homeDirectory = "/home/${username}";
  #   stateVersion = "24.11";
  # };

  # programs.home-manager.enable = true;
}
