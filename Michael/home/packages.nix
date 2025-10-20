{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    jetbrains-toolbox
    libreoffice-fresh
    obsidian
    parsec-bin
    unityhub
    # voicevox
    zoom-us

    clang-tools
    clangStdenv
    dig
    docker-compose
    flex
    gcc
    gdb
    grim
    jdk17
    mise
    power-profiles-daemon
    slurp
    swappy
    termpdfpy
    typst
    unzip
    vlc
    wayland-scanner
    wireshark
    yt-dlp
  ];
}
