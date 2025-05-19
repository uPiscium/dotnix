{ pkgs, ... }: {
  home.packages = with pkgs; [
    bambu-studio
    code-cursor
    discord
    gdlauncher-carbon
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    haskellPackages.matlab
    hexedit
    jetbrains-toolbox
    jetbrains.rider
    libreoffice-fresh
    modrinth-app
    parsec-bin
    unityhub
    zoom

    clang-tools
    clangStdenv
    cmake
    docker-compose
    # dotnet-sdk-wrapped
    dotnet-sdk_8
    # dotnetCorePackages.sdk_8_0-bin
    flex
    gcc
    gdb
    ggshield
    go
    grim
    htop
    jdk17
    nyancat
    mise
    mono
    power-profiles-daemon
    python311
    rustup
    samba
    sl
    slurp
    swappy
    termpdfpy
    typst
    uv
    vlc
    wayland-scanner
    wine
    yt-dlp
  ];
}
