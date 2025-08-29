{ ... }: {
  imports = [
    ./hyprland.nix
    ./packages.nix

    ../../common/homemanager
    ../../module/homemanager/browser.nix
    ../../module/homemanager/hyprland.nix
    ../../module/homemanager/gtk.nix
  ];
}
