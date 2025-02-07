{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    fastfetch
    ffmpeg
    fzf
    less
    ripgrep
    traceroute
    tree
    unzip
    yazi
    zip
  ];
}
