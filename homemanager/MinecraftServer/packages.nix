{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    docker-compose
    fastfetch
    ffmpeg
    fzf
    less
    jdk17
    ripgrep
    traceroute
    tree
    unzip
    yazi
    zip
  ];
}
