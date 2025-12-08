{ pkgs, ... }: {
  home.packages = with pkgs; [
    blender
    vesktop
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    jetbrains-toolbox
    onlyoffice-desktopeditors
    obsidian
    parsec-bin
    unityhub
    vlc
    wireshark
    zoom-us

    dig
    grim
    jdk17
    power-profiles-daemon
    slurp
    swappy
    termpdfpy
    typst
    unzip
    wayland-scanner
    yt-dlp
  ];
}
