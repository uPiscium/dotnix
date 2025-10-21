{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kanshi
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # withUWSM = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # services.displayManager.sddm = {
  #   enable = false;
  #   theme = "astronaut";
  #   wayland.enable = true;
  # };

  services.displayManager.gdm = {
    enable = true;
  };
}
