{ ... }: {
  imports = [
    ./packages.nix

    ../../module/homemanager/browser.nix
    ../../module/homemanager/gtk.nix
    ../../module/homemanager/hyprland.nix
  ];

  # home = rec {
  #   username = "upiscium";
  #   homeDirectory = "/home/${username}";
  #   stateVersion = "24.11";
  # };

  # programs.home-manager.enable = true;
}
