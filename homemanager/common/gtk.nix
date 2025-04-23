{pkgs, ...} :
{
  gtk.enable = true;
  gtk.theme.package = pkgs.stilo-themes;
  gtk.theme.name = "Stilo";
  gtk.iconTheme.package = pkgs.tela-icon-theme;
  gtk.iconTheme.name = "Tela";
}
