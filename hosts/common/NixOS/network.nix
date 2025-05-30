{ hostname, ... }: {
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  programs.kdeconnect.enable = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.avahi = {
    enable = true;
    openFirewall = true;
  };
}
