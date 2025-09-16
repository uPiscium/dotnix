{ ... }: {
  networking.firewall = {
    allowedTCPPorts = [ 20000 8004 8005 ];
    allowedUDPPorts = [ ];
  };
}

