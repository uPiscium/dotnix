{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    bun
    cifs-utils
    fastfetch
    ffmpeg
    fzf
    imagemagick
    less
lua
    obsidian
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
}
