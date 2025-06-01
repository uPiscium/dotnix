{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia-container-toolkit.enable = true;

  # virtualisation.docker.enableNvidia = true;
  # virtualisation.containers.cdi.dynamic.nvidia.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      nvidiaBusId = "PCI:0:10:0";
    };
  };

  # environment.etc."docker/daemon.json".text = ''
  #   {
  #     "default-runtime": "nvidia",
  #     "runtimes": {
  #       "nvidia": {
  #         "path": "nvidia-container-runtime",
  #         "runtime-args": []
  #       }
  #     }
  #   }
  # '';
}
