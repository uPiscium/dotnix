{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    blender
    # curseforge
    discord
    gdlauncher-carbon
    # gpu-screen-recorder-git
    # gpu-screen-recorder-gtk-git
    hexedit
    jetbrains-toolbox
    libreoffice-fresh
    parsec-bin
    unityhub
    zoom

    bottom
    clang-tools
    clangStdenv
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
    nettools
    nmap
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
    unar
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
