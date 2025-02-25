{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    blender
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    hexedit
    jetbrains-toolbox
    libreoffice-fresh
    parsec-bin
    unityhub
    zoom

    clang-tools
    clangStdenv
    cmake
    # cpupower
    docker-compose
    gcc
    gdb
    go
    grim
    htop
    jdk17
    nyancat
    ollama-cuda
    power-profiles-daemon
    python311
    realvnc-vnc-viewer
    rustup
    sl
    slurp
    swappy
    tdf
    tinymist
    tmux
    typst
    uv
    vlc
    wayland-scanner
    wine
    yt-dlp
  ];
}
