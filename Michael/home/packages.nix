{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    jetbrains-toolbox
    libreoffice-fresh
    parsec-bin
    unityhub
    # voicevox
    vscode
    zoom

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
