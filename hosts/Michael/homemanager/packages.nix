{ pkgs, ... }: {
  home.packages = with pkgs; [
    bambu-studio
    code-cursor
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    hexedit
    jetbrains-toolbox
    jetbrains.rider
    libreoffice-fresh
    modrinth-app
    nemo-with-extensions
    parsec-bin
    # unityhub
    zoom

    clang-tools
    clangStdenv
    docker-compose
    flex
    gcc
    gdb
    # ggshield
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
