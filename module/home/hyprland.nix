{ pkgs, hostname, ... }: {
  home.packages = with pkgs; [
    # anyrun
    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    nemo-with-extensions
    networkmanagerapplet
    nextcloud-client
    playerctl
    swaynotificationcenter
    waybar
    walker
    wl-clipboard
    wlogout
  ];

  home.file.".config/hypr/" = {
    source = ../../config.d/hypr/${hostname};
    recursive = true;
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

