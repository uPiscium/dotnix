{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
  };

  home.file.".config/kitty" = {
    source = ../../config.d/kitty;
    recursive = true;
  };
}
