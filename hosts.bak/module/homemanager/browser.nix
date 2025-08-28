{
  programs.google-chrome = {
    enable = true;
    commandLineArgs = [ "--enable-wayland-ime" "--ozone-platform=wayland" ];
  };
}

