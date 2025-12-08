{ ... }: {
  imports = [
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./terminal.nix
    ./zsh.nix
  ];

  # home = rec {
  #   username = "upiscium";
  #   homeDirectory = "/home/${username}";
  #   stateVersion = "25.11";
  # };

  programs.home-manager.enable = true;
}

