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

  home.file.".config/Code/User" = {
    source = ../../config.d/vscode;
    recursive = true;
  };

  home.file.".config/nvim-vscode" = {
    source = ../../config.d/nvim-vscode;
    recursive = true;
  };
}
