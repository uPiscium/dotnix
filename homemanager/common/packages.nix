{ pkgs, ... }: {
  home.packages = with pkgs; [
    imagemagick
    bottom
    fastfetch
    ffmpeg
    fzf
    less
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
