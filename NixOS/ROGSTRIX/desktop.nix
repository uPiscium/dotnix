{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "chili";
    wayland.enable = true;
  };
}
