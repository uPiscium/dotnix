{ ... }: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./gtk.nix
    ./neovim.nix
    ./packages.nix
    ./terminal.nix
    ./zsh.nix
  ];

  home = rec {
    username = "upiscium";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}

