{inputs, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  services.xserver.enable = true;
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

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
