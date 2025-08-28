{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    asusctl
  ];

  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
}
