{ pkgs, ... }: {
  home.packages = with pkgs; [
    blender
    # discord
    vesktop
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    jetbrains-toolbox
    onlyoffice-desktopeditors
    obsidian
    parsec-bin
    unityhub
    zoom-us

    (clang-tools.override {
        enableLibcxx = true;
    })
    # clangStdenv
    dig
    docker-compose
    flex
    # libgcc
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
