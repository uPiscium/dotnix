{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

  virtualisation.docker.rootless.daemon.settings.features.cdi = true;
  hardware.nvidia-container-toolkit.enable = true;

  services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
