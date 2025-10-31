{ pkgs, hostname, ... }: {
  home.packages = with pkgs; [
    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    nemo-with-extensions
    networkmanagerapplet
    playerctl
    swaynotificationcenter
    waybar
    wofi
    wl-clipboard
    wlogout
  ];


  home.file.".config/niri" = {
    source = ../../config.d/niri;
    exclude = [ "platforms" ];
    recursive = true;
  };

  home.file.".config/niri/platform.kdl" = {
    source = ../../config.d/niri/platforms/${hostname}.kdl;
  };

  home.file.".config/swaync" = {
    source = ../../config.d/swaync;
    recursive = true;
  };

  home.file.".config/waybar" = {
    source = ../../config.d/waybar;
    recursive = true;
  };

  home.file.".config/wlogout" = {
    source = ../../config.d/wlogout;
    recursive = true;
  };

  home.file.".config/wofi" = {
    source = ../../config.d/wofi;
    recursive = true;
  };
}

