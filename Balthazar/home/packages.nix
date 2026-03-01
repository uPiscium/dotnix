{ pkgs, ... }: {
  home.packages = with pkgs; [
    antigravity
    # bambu-studio
    # blender
    # discord
    # vesktop
    claude-code
    # gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    # jetbrains-toolbox
    # modrinth-app
    # krita
    # onlyoffice-desktopeditors
    # obsidian
    # parsec-bin
    # slack
    sunshine
    unityhub
    # teams-for-linux
    vlc
    wireshark
    # zoom-us

    dig
    grim
    jdk17
    power-profiles-daemon
    slurp
    swappy
    # termpdfpy
    typst
    unzip
    wayland-scanner
    yt-dlp
  ];
}
