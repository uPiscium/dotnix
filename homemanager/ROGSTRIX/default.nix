{ ... }: {
  imports = [
    ./browser.nix
    ./direnv.nix
    ./hyprland.nix
  ];

  # home = rec {
  #   username = "upiscium";
  #   homeDirectory = "/home/${username}";
  #   stateVersion = "24.11";
  # };

  # programs.home-manager.enable = true;
}
