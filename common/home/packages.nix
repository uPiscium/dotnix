{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    bun
    cifs-utils
    colordiff
    fastfetch
    ffmpeg
    fzf
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

  nixpkgs.config.permittedInsecurePackages = [
    "libxml2-2.13.8"
  ];
  nixpkgs.config.allowUnfree = true;
}
