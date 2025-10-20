{ ... }: {
  imports = [
    ../../common/home

    ../../module/home/browser.nix
    ../../module/home/gtk.nix
    ../../module/home/hyprland.nix

    ./packages.nix
  ];

  home.file.".config/uwsm/env".text = ''
    export GMB_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    # export LIBVA_DRIVER_NAME=nvidia
  '';
}
