{ ... }: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./terminal.nix
    ./zsh.nix
  ];

  home = rec {
    username = "upiscium";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}

