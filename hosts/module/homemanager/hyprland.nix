{ pkgs, hostname, ... }: {
  home.packages = with pkgs; [
    anyrun
    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    networkmanagerapplet
    playerctl
    swaynotificationcenter
    waybar
    wl-clipboard
    wlogout
  ];

  home.file.".config/hypr/" = {
    source = ../../config.d/hypr/${hostname};
    recursive = true;
  };

  home.file.".config/anyrun/" = {
    source = ../../config.d/anyrun;
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

}

