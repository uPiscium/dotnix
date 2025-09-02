{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    # tmux
  ];

  programs.kitty = {
    enable = true;
  };
  # programs.tmux = {
  #   enable = true;
  # };

  # programs.wezterm = {
  #   enable = true;
  # };

  home.file.".config/kitty" = {
    source = ../../config.d/kitty;
    recursive = true;
  };

  # home.file.".config/wezterm" = {
  #   source = ../config.d/wezterm;
  #   recursive = true;
  # };
}
