{ ... }: {
  imports = [
    ../../homemanager/common
    ../../homemanager/ROGSTRIX
  ];
  home.file.".config/uwsm/env".text = ''
    export GMB_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    # export LIBVA_DRIVER_NAME=nvidia
  '';
}
