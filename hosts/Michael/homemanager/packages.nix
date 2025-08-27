{ pkgs, ... }: {
  home.packages = with pkgs; [
    # byobu
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    hexedit
    jetbrains-toolbox
    # krita
    libreoffice-fresh
    # modrinth-app
    parsec-bin
    unityhub
    voicevox
    zoom

    clang-tools
    clangStdenv
    dig
    docker-compose
    flex
    gcc
    gdb
    go
    grim
    htop
    jdk17
    nyancat
    mise
    mono
    power-profiles-daemon
    python311
    sl
    slurp
    swappy
    termpdfpy
    typst
    unzip
    uv
    vlc
    wayland-scanner
    wine
    wireshark
    yt-dlp
  ];
}
