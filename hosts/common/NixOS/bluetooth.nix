{ ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        experimental = true;
      };
    };
  };

  services.blueman.enable = true;
}
