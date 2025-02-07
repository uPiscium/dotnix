{...}: {
  imports = [
    ./browser.nix
    ./git.nix
    ./hyprland.nix
    ./neovim.nix
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
