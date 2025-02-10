{ hostname, ... }: {
  services.openssh.enable = true;
  # programs.kdeconnect.enable = true;

  programs.ssh = {
    pubkeyAcceptedKeyTypes = [ "ssh-ed25519" ];
    hostKeyAlgorithms = [ "ssh-ed25519" ];
  };


  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ ];
    allowedTCPPorts = [ 20000 ];
    allowedUDPPorts = [ ];
    allowedTCPPortRanges = [
      # {from=0; to=0;}
    ];
    allowedUDPPortRanges = [
      # {from=0; to=0;}
    ];
  };

  services.avahi = {
    enable = true;
    openFirewall = true;
  };
}
