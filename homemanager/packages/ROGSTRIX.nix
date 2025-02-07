{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    blender
    # curseforge
    discord
    # gpu-screen-recorder-git
    # gpu-screen-recorder-gtk-git
    hexedit
    jetbrains-toolbox
    libreoffice-fresh
    parsec-bin
    unityhub
    zoom

    bottom
    llvmPackages_19.clang-unwrapped
    cmake
    # cpupower
    docker-compose
    fastfetch
    ffmpeg
    fzf
    gcc
    gdb
    go
    grim
    htop
    jdk17
    less
    nyancat
    ollama
    power-profiles-daemon
    python311
    # python-pyqt5
    realvnc-vnc-viewer
    ripgrep
    rustup
    # screengrab
    sl
    # termpdf-git
    tdf
    tinymist
    tmux
    traceroute
    tree
    typst
    unzip
    uv
    vlc
    wayland-scanner
    wine
    yazi
    yt-dlp
    zip
  ];
}
