{ ... }: {
  imports = [
    ./hyprland.nix
    ./packages.nix

    ../../common/home
    ../../module/home/browser.nix
    ../../module/home/hyprland.nix
    ../../module/home/gtk.nix
  ];
}
