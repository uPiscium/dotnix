{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    hexedit
    libreoffice-fresh
    parsec-bin
    # unityhub
    zoom

    clang-tools
    clangStdenv
    cmake
    # cpupower
    docker-compose
    # dotnetCorePackages.runtime_9_0-bin
    dotnetCorePackages.sdk_9_0-bin
    gcc
    gdb
    go
    grim
    htop
    jdk17
    nyancat
    mono
    power-profiles-daemon
    python311
    realvnc-vnc-viewer
    rustup
    sl
    slurp
    swappy
    tdf
    tmux
    termpdfpy
    typst
    uv
    vlc
    wayland-scanner
    wine
    yt-dlp
  ];
}
