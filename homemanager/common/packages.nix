{ pkgs, ... }: {
  home.packages = with pkgs; [
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
