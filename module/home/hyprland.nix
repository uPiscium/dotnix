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

  home.file.".config/hypr/hypridle.conf" = {
    source = ../../config.d/hypr/hypridle.conf;
  };

  home.file.".config/hypr/hyprland.conf" = {
    source = ../../config.d/hypr/hyprland.conf;
  };

  home.file.".config/hypr/hyprlock.conf" = {
    source = ../../config.d/hypr/hyprlock.conf;
  };

  home.file.".config/hypr/hyprpaper.conf" = {
    source = ../../config.d/hypr/hyprpaper.conf;
  };

  home.file.".config/hypr/platform.conf" = {
    source = ../../config.d/hypr/platforms/${hostname}.conf;
  };

  home.file.".config/ly" = {
    source = ../../config.d/ly;
    recursive = true;
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

