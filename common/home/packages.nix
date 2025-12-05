{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    bun
    cifs-utils

    colordiff
    fastfetch
    ffmpeg
    fzf
    libgcc
    gcc
    imagemagick
    less
    lua
    nettools
    nmap
    ripgrep
    traceroute
    tree
    unar
    yazi
    zip
    zsh-nix-shell
  ];

  nixpkgs.config.allowUnfree = true;
}
