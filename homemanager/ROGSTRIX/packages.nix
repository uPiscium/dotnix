{ pkgs, ... }: {
  home.packages = with pkgs; [
    arduino-ide
    blender
    discord
    gdlauncher-carbon
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
    nextjs-ollama-llm-ui
    power-profiles-daemon
    python311
    realvnc-vnc-viewer
    rustup
    sl
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
