{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
    sddm-sugar-dark
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # withUWSM = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "sugar-dark";
    wayland.enable = true;
  };
}
