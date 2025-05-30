{ ... }: {
  # networking.hostName = "base"; # Provide a default hostname
  services.qemuGuest.enable = true; # Enable QEMU Guest for Proxmox
  boot.loader.grub.enable = true; # Use the boot drive for GRUB
  boot.loader.grub.devices = [ "nodev" ];
  boot.growPartition = true;
}

