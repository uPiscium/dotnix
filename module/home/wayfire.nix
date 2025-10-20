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
    walker
    wl-clipboard
    wlogout
  ];

  home.file.".config/wayfire.ini" = {
    source = ../../config.d/wayfire/${hostname}.ini;
  };

  home.file.".config/wayfire/backgrounds/bg.png" = {
    source = ../../config.d/wayfire/assets/bg.png;
  };

  # home.file.".config/anyrun/" = {
  #   source = ../../config.d/anyrun;
  #   recursive = true;
  # };

  home.file.".config/walker" = {
    source = ../../config.d/walker;
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

  home.file.".config/swaync" = {
    source = ../../config.d/swaync;
    recursive = true;
  };
}

