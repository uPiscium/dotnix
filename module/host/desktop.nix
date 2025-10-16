{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # withUWSM = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "astronaut";
    wayland.enable = true;
  };
}
