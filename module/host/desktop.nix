{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kanshi
  ];

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/start-hyprland";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    # withUWSM = true;
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
