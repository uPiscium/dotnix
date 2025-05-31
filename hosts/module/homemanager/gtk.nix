{ pkgs, ... }:
{
  gtk.enable = true;
  gtk.theme.package = pkgs.stilo-themes;
  gtk.theme.name = "Stilo";
  gtk.iconTheme.package = pkgs.tela-icon-theme;
  gtk.iconTheme.name = "Tela";
  gtk.cursorTheme.package = pkgs.volantes-cursors;
  gtk.cursorTheme.name = "Volantes";

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.package = pkgs.stilo-themes;
}
