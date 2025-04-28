{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    cifs-utils
    fastfetch
    ffmpeg
    fzf
    imagemagick
    less
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
