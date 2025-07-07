{ ... }: {
  imports = [
    ./packages.nix

    ../../module/homemanager/browser.nix
    ../../module/homemanager/gtk.nix
    ../../module/homemanager/hyprland.nix
  ];
}
