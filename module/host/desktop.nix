{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sddm-astronaut
    kanshi
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # withUWSM = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.displayManager.sddm = {
    enable = false;
    theme = "astronaut";
    wayland.enable = true;
  };

  services.displayManager.ly = {
    enable = true;
  };

  environment.etc."ly/config.ini" = {
    source = ../../config.d/ly/config.ini;
  };
}
