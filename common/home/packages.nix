{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    bun
    cifs-utils
    fastfetch
    ffmpeg
    fzf
    gcc
    imagemagick
    less
    lua
    nfs-utils
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
