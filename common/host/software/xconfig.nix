{pkgs, ...}: {
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

}
