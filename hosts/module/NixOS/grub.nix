{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      zfsSupport = true;
      efiSupport = true;
      useOSProber = true;
      theme = pkgs.sleek-grub-theme;
    };
  };
}
