{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    docker-compose
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
